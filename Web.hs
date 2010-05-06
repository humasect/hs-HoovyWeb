module Web where

import Text.Html
import System.Directory
import Control.Monad (when)

import qualified Hoovy
import qualified About
import qualified Projects

-- Past projects
import qualified Past
import qualified Nova
import qualified NovaContent
import qualified NovaShell
import qualified NovaEditor
import qualified NovaEngine
import qualified NovaImpl

import qualified GrenadierBleu

dest = "/Users/humasect/Sites/hvweb/"

writeHtml n h =
	putStrLn ("writeHtml: "++n) >>
	writeFile (dest++n) (renderHtml h)

cp_f s =
	let d = dest++s in
        putStrLn ("copying "++s) >>
--	putStrLn ("cp -f "++s++" "++d) >>
	doesFileExist d >>= \b -> when b (removeFile d) >>
	copyFile s d

main :: IO ()
main = do
        putStrLn ("---- "++dest++" ----")
	mapM_ (\n-> cp_f $ n++".png") [
		"humasectb", "example1", "example2", "shell1",
		"editor1", "inspectModel", "inspectSel", "inspectWinding", "inspectStep", "browseHead", "browseList"]

	mapM_ (\n -> createDirectoryIfMissing True (dest++n))
          ["About", "Projects",
           "Projects/Novapilot", "Projects/GrenadierBleu",
           "Projects/Past", "Projects/Past/Nova", "Projects/Past/humaRO", "Projects/Past/HaskellPlugin"]

	mapM_ (\(a,b) -> writeHtml a b) [
		("index.html", Hoovy.page),
                ("About/index.html", About.page),
                ("Projects/index.html", Projects.page),
                ("Projects/Past/index.html", Past.page),
		("Projects/Past/Nova/index.html", Nova.page),
		("Projects/Past/Nova/content.html", NovaContent.page),
		("Projects/Past/Nova/shell.html", NovaShell.page),
		("Projects/Past/Nova/editor.html", NovaEditor.page),
		("Projects/Past/Nova/engine.html", NovaEngine.page),
		("Projects/Past/Nova/implementation.html", NovaImpl.page),
                ("Projects/Past/humaRO/index.html", Past.humaROPage),
		("Projects/GrenadierBleu/index.html", GrenadierBleu.page)
		]
