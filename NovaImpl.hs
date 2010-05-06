module NovaImpl (page) where

import Text.Html

import Shared
import Nova (npPage)

pgbody = p << ("All content, code, design, and even website is developed and compiled with" +++ spaceHtml +++ mklink ("Glasgow Haskell","http://www.haskell.org/ghc/")
               +++ spaceHtml +++ " version 6.10, on a MacBook of these specifications:")
     +++ bulletList [
           "Intel Core 2 Duo 2.0Ghz",
           "1GB RAM",
           "Intel GMA 950",
           "Mac OS X 10.5"]
     +++ p << "And so will run with at least this hardware or of faster calibur. The software is developed cross-platform so will run on any OS which runs GHC and also OpenGL and OpenAL libraries, and so on Linux and Windows as well. Binaries for Windows and Mac will be provided."

page :: Html
page = npPage "Implementation" pgbody
