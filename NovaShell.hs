module NovaShell (page) where

import Text.Html

import Shared
import Nova (npPage)

pgbody :: Html
pgbody =
	(center << imageFile Nothing "shell1") +++ br +++ br
	+++ "The Nova Shell can be the developer's most powerful tool-of-tools. It has the basic functionality as "+++mklink ("GHCi","http://www.haskell.org/ghc/docs/latest/html/users_guide/ghci.html")+++", but its creation was necessitated by these very specific reasons, which are detailed below: "+++numberList reasons

	+++ "To compile it, execute '" +++ (tt << "make shell") +++ "' within the "+++(tt << "Source")+++" directory. It will take some minutes and finish with an executable sized about 30 megabytes, this is because of the GHC API used which allows the reflectivity necessary to develop Haskell within a running Haskell program."
	+++ h3 << "1. Starting the Shell" +++ starting
	+++ h3 << "2. Built-in Commands" +++ builtins
	where
	reasons = [
		"No support in GHCi for working with OpenGL; applications using this will simply crash.",
		"Maintaining (application-specific) program state across code reloading, and",
		"Custom support for game and engine development, such as namespaces, and global commands such as start/stop execution, save/load states, etc"
		]

starting :: Html
starting = "The Shell will execute in what is called Dev (game) mode with no parameters, or in Editor mode if passed"
	+++(tt<<"-edit")+++". It will load the various code and Haskell modules necessary for either mode. In Dev mode, the game code is required; for example GrenadierBleu and its modules. In Editor mode, no game code is used."

builtins :: Html
builtins =
	"Those with prefix ':' are part of the shell. The rest would be found in either Dev or Editor. When the Engine is paused, only the display callback is enabled, so code changes can still reflect the program state; also it uses very minimal CPU when in paused state." +++
	blockquote << commandList [
	(":ss", "Toggle the use of snapshots when recompiling code, enabled by default."),
	(":q", "Quit."),
	(":re", "Reload all known modules, starting with either Dev or Editor."),
	(":m <module>", "Load a specific module and bring it into scope."),
	("run", "Continue execution of Engine"),
	("pause", "Pause execution of Engine"),
	("runUntil <time>", "Execute Engine until specified time (unimplemented)"),
	("runFor <seconds>", "Execute Engine for <seconds> (unimplemented"),
	("speed <tickmul>", "Set the multiplier for Engine ticks: 0.5 = half speed, 2.0 = double speed"),
	("(anything else)", "Execute as Haskell statement.")
	]

page :: Html
page = npPage "Shell" (blockquote << pgbody)
