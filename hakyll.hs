#!/usr/bin/env runhaskell

{-Thanks to jaspervdj: http://jaspervdj.be/ -}
--------------------------------------------------------------------------------
{-# LANGUAGE Arrows            #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where


--------------------------------------------------------------------------------
import           Data.Monoid         (mappend, mconcat)
import           Data.Map            (lookup)
import           Prelude             hiding (id)
import           System.Cmd          (system)
import           System.FilePath     (replaceExtension, takeDirectory, takeBaseName, (</>))
import qualified Text.Pandoc         as Pandoc


--------------------------------------------------------------------------------
import           Hakyll


--------------------------------------------------------------------------------
-- | Entry point
main :: IO ()
main = hakyllWith config $ do
         -- Static files
    match ("images/*" .||. "js/*" .||. "favicon.ico" .||. "files/**" .||. "fonts/*") $ do
        route   idRoute
        compile copyFileCompiler

    -- Compress CSS
    match "css/*" $ do
        route idRoute
        compile compressCssCompiler


    -- Build tags
    tags <- buildTags "talks/*" (fromCapture "tags/*.html")

    -- Render each and every talk
    match "talks/*" $ do
        route   $ niceRoute
        compile $ do
            pandocCompilerWith defaultHakyllReaderOptions pandocOptions
                >>= saveSnapshot "content"
                >>= return . fmap demoteHeaders
                >>= loadAndApplyTemplate "templates/post.html" (postCtx tags)
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= removeIndexHtml
                
    -- Post list
    create ["talks.html"] $ do
         route idRoute
         compile $ do
             list <- postList tags "talks/*" recentFirst
             makeItem ""
                >>= loadAndApplyTemplate "templates/talks.html"
                        (constField "title" "All Talks" `mappend`
                         constField "talks" list `mappend`
                         defaultContext)
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= removeIndexHtml

    -- Post tags
    tagsRules tags $ \tag pattern -> do
         let title = "Talks tagged " ++ tag

        -- Copied from posts, need to refactor
         route $ niceRoute
         compile $ do
             list <- postList tags pattern recentFirst
             makeItem ""
                >>= loadAndApplyTemplate "templates/talks.html"
                        (constField "title" title `mappend`
                         constField "talks" list `mappend`
                         defaultContext)
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= removeIndexHtml

        -- Create RSS feed as well
         version "rss" $ do
             route   $ setExtension "xml"
             compile $ loadAllSnapshots pattern "content"
                >>= fmap (take 10) . recentFirst
                >>= renderAtom (feedConfiguration title) feedCtx

    -- Index
    match "index.html" $ do
        route idRoute
        compile $ do
            list <- postList tags "talks/*" $ fmap (take 3) . recentFirst
            let indexContext = constField "talks" list `mappend`
                               field "tags" (\_ -> renderTagList tags) `mappend`
                               defaultContext

            getResourceBody
                >>= applyAsTemplate indexContext
                >>= loadAndApplyTemplate "templates/default.html" indexContext
                >>= relativizeUrls
                >>= removeIndexHtml

    -- Read templates
    match "templates/*" $ compile $ templateCompiler

    -- Render some static pages
    match (fromList pages) $ do
        route   $ setExtension ".html"
        compile $ pandocCompilerWith defaultHakyllReaderOptions pandocOptions
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= removeIndexHtml


    -- Render RSS feed
    create ["rss.xml"] $ do
        route idRoute
        compile $ do
            loadAllSnapshots "talks/*" "content"
                >>= fmap (take 10) . recentFirst
                >>= renderAtom (feedConfiguration "All talks") feedCtx

   
    where
    pages =
        [ 
          "about.md"
        ]


--------------------------------------------------------------------------------
postCtx :: Tags -> Context String
postCtx tags = mconcat
    [ dateField "date" "%B %e, %Y"
    , tagsField "tags" tags
    , defaultContext
    ]


-------------------------------------------------------------------------------
-- replace a foo/bar.md by foo/bar/index.html
-- this way the url looks like: foo/bar/ in most browsers
niceRoute :: Routes
niceRoute = customRoute createIndexRoute
  where
    createIndexRoute ident = takeDirectory p </> takeBaseName p </> "index.html"
                             where p=toFilePath ident

-- replace url of the form foo/bar/index.html by foo/bar
removeIndexHtml :: Item String -> Compiler (Item String)
removeIndexHtml item = return $ fmap (withUrls removeIndexStr) item
  where
    removeIndexStr :: String -> String
    removeIndexStr str@(x:xs) | str == "/index.html" = ""
                              | otherwise = x:removeIndexStr xs
    removeIndexStr [] = []

--------------------------------------------------------------------------------
feedCtx :: Context String
feedCtx = mconcat
    [ bodyField "description"
    , defaultContext
    ]


--------------------------------------------------------------------------------
config :: Configuration
config = defaultConfiguration
    { deployCommand = "rsync -avz --delete --checksum _site/* jayeshkg@webhome.cc.iitk.ac.in:/www/jayeshkg/www/science-coffehouse"
    }


feedConfiguration :: String -> FeedConfiguration
feedConfiguration title = FeedConfiguration
    { feedTitle       = "Science Coffeehouse - " ++ title
    , feedDescription = "Talks"
    , feedAuthorName  = "Science Coffeehouse"
    , feedAuthorEmail = "seek.iitk@gmail.com"
    , feedRoot        = "http://home.iitk.ac.in/~nitica/sciencecoffeehouse"
    }

pandocOptions :: Pandoc.WriterOptions
pandocOptions = defaultHakyllWriterOptions
    { Pandoc.writerHTMLMathMethod = Pandoc.MathJax ""
    }

--------------------------------------------------------------------------------
sassCompiler :: Compiler (Item String)
sassCompiler =
  getResourceString
    >>= withItemBody (unixFilter "sass" ["-s", "--scss"])
    >>= return . fmap compressCss

--------------------------------------------------------------------------------
mathjax :: Item String -> Compiler String
mathjax item = do
    metadata <- getMetadata (itemIdentifier item)
    return $ case Data.Map.lookup "math" metadata of
        Just "true" -> "<script type=\"text/javascript\" src=\"http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML\" />"
        otherwise   -> ""
--------------------------------------------------------------------------------

postList :: Tags -> Pattern -> ([Item String] -> Compiler [Item String])
         -> Compiler String
postList tags pattern preprocess' = do
    postItemTpl <- loadBody "templates/postitem.html"
    talks       <- preprocess' =<< loadAll pattern
    applyTemplateList postItemTpl (postCtx tags) talks
