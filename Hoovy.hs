module Hoovy where

import Text.Html

import Shared

pgbody :: Html
pgbody =
	table ! [border 0] << tableContents
	+++ br

tableContents :: HtmlTable
tableContents = (hoovy `above` studios `above` projects) `beside` (td << humaLogo)
	where
	hoovy = td ! [align "center"]
                  << font ![size "7",face "Arial Black"] 
                      << "Hoovy"
	studios = td ! [align "center"]
                  << font ![size "6"] 
                      << italics << "studio"
	projects  = td << font ! [size "5"] 
                      << ""

hvFooter atRoot = footyLinks atRoot ""
	[("Hoovy","")] [
	("About","About"),
	("Projects","Projects"),
	("Wiki","Wiki"),
	("Blog","Blog")
	]

page :: Html
page = hvPage "Hoovy Studio" (pgbody +++ hvFooter True)
