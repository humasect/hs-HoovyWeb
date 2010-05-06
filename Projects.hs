module Projects (page) where

import Text.Html

import Shared

pgbody :: Html
pgbody =
    p << ("Here is to be found the current activity.")

projectsFooter atRoot = footyLinks atRoot ""
	[("Hoovy","")] [
          ("Novapilot","Projects/Novapilot"),
          ("Gamelike","Projects/Gamelike"),
          ("Grenadier Bleu","Projects/GrenadierBleu"),
          ("Polyverse","Projects/Polyverse"),
          ("Past","Projects/Past")
	]

page :: Html
page = hvSubPage "Hoovy Projects" (pgbody +++ projectsFooter True)
