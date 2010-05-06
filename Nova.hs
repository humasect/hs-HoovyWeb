module Nova (page, npPage) where

import Text.Html

import Shared

pgbody :: Html
pgbody =
	p << ("Nova is the enlightened technology designed and developed for advanced real time, hardware accelerated, modern and high level flexibility, power and wisdom for simplistically profound and virtuously productive game development, which is demonstrated through the games created with it. This is only made possible by employing the functional, declarative, pattern matching, type-safe, lazy, "+++mklink("Haskell","http://www.haskell.org")+++" development system. There are four facets of Novapilot, divided into categories:")
	+++ bulletList facets
	+++ p << "These four concepts are mutually dependant pieces which work together in harmony."
	where
	facets = [
		"The created content; which are essentially intelligent pieces of visual and aural 'code' called Models",
		"The editor; used to create, edit and design these models made up of mutators, animations, procedures, etc",
		"The shell; used for development of main code, editor code, debugging, and game logic",
		"The integration engine; which threads through it all"
		]

npFooter atRoot = footyLinks atRoot "Projects/Past/Nova/"
	[("Nova","")] [
	("The Content","content.html"),
	("The Shell","shell.html"),
	("The Editor","editor.html"),
	("The Engine","engine.html"),
	("Implementation","implementation.html")
	]

npPage :: String -> Html -> Html
npPage s bd = npPage' s bd False

npPage' :: String -> Html -> Bool -> Html
npPage' s bd isRoot = hvSubPage ((if isRoot then "" else "The ")++"Nova "++s) (bd +++ npFooter isRoot)

page :: Html
page = npPage' "" pgbody True
