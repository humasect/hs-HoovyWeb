module GrenadierBleu (page) where

import Text.Html

import Shared

pgbody = br +++ (table ! [border 0, cellspacing 0] << (news `above` status)) +++ br
	where
	news = plot $ hvHeading "News" spaceHtml
	status = plot $  hvHeading "Status" spaceHtml

	plot x = td ! [bgcolor "#8888aa", width "10000"] << center << font ! [color "#ffffff"] << x

gbFooter' :: Bool -> Html
gbFooter' atRoot =
	linkList ((mainLinks atRoot) ++ [
		("Items","GrenadierBleu/items.html")
		])
	where
	mainLinks True = []
	mainLinks False = [("Grenadier Bleu","GrenadierBleu/")]

gbFooter atRoot = footyLinks atRoot "GrenadierBleu/"
	[("Grenadier Bleu","")] [
	("Information", "info.html"),
	("Story", "story.html"),
	("System", "system.html"),
	("Gallery", "gallery.html")
	]

page = hvSubPage "Grenadier Bleu" (pgbody +++ gbFooter True)
