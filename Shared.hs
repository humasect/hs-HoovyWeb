module Shared where

import Text.Html

--webroot = "/~humasect/Hoovy/"
webroot = "/"
webfile = (++) webroot

imageFile :: Maybe (Int,Int) -> String -> Html
imageFile Nothing s = image ! [src $ webfile (s++".png")]
imageFile (Just (w,h)) s =
	let hr = webfile (s++".png") in
	let img = image ! [src hr, width (show w), height h] in
	if s /= "humasectb" then anchor ! [href hr] << img else img

humaLogo :: Html
humaLogo = imageFile Nothing "humasectb" --image ! [src $ webfile "humasectb.png"]

smallLogo :: Html
smallLogo = anchor ! [href webroot] << imageFile (Just (100,100)) "humasectb"
	--(image ! [src $ webfile "humasectb.png",width "100",height 100])

logoHeader :: String -> Html
logoHeader s = table ! [border 0] << (title `beside` logo)
	where
	title = td ! [align "left", nowrap]
		<< font ! [size "6",face "Arial Black"] << s
	logo = td ! [width "10000", align "right"] << smallLogo

mknplinkList :: [(String,String)] -> Html
mknplinkList ss = foldl1 (\a b-> a +++ spaceHtml +++ "|" +++ spaceHtml +++ b) (map mknplink ss)

mknplink :: (String,String) -> Html
mknplink (s,n) = mklink (s,webfile n)

mklink :: (String,String) -> Html
mklink (s,n) = anchor ! [href n] << s

linkList :: [(String,String)] -> Html
linkList ls = table ! [align "center", border 0] << (td ! [align "center"] << mknplinkList ls)

bulletList :: [String] -> Html
bulletList ls = ulist << map (li <<) ls

numberList :: [String] -> Html
numberList ls = olist << map (li <<) ls

commandList :: [(String,String)] -> Html
commandList = rawDualList tt thehtml

rawDualList :: (Html -> Html) -> (Html->Html) -> [(String,String)] -> Html
rawDualList a b ls = table ! [border 0] << (foldr1 (above) $
	map (\(l,d) ->
		(td ! [nowrap] << a << l) `beside`
		(td ! [width "32"] << spaceHtml) `beside`
		(td ! [nowrap] << b << d))
		ls)

codeList :: [String] -> Html
codeList ls = commandList $ map (\x -> (x,"")) ls

hvHeading :: String -> Html -> Html
hvHeading s h = h3 << (anchor ! [name s] << s) +++ (blockquote << h)

hvCopyright :: Html
hvCopyright = p ! [align "right"] << (italics << ("Copyright "+++copyright+++" 2008 ") +++
	italics << mklink ("Lyndon Tremblay","mailto:humasect@gmail.com"))

hvPage :: String -> Html -> Html
hvPage t b = header << thetitle << t
	+++ body ! [bgcolor "#ffffff",face "Arial Black"] << (b +++ hvCopyright)

hvSubPage :: String -> Html -> Html
hvSubPage t b = hvPage t (logoHeader t +++ b)

footyLinks atRoot dir ms ls =
	linkList ((mainLinks atRoot) ++ formLinks ls)
	where
	mainLinks True = []
	mainLinks False = formLinks ms
	formLinks = map (\(a,b) -> (a,dir++b))
