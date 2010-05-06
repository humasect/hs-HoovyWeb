module Past (page, humaROPage, haskellPluginPage) where

import Text.Html

import Shared

pastBody :: Html
pastBody =
    p << "These are the projects we here at Hoovy have so pleasantly efforted into being." +++
    p << bulletList otherPast
    where
      otherPast = [
        "AthenaDB - MMO server admin app for iPhone",
        "Valhalla - Squeak MMO game server",
        "GNU Smalltalk / Objective-C language hybrid",
        "MP3 Files..."
        ]

pastFooter atRoot = footyLinks atRoot ""
	[("Hoovy","")] [
          ("Nova","Projects/Past/Nova"),
          ("humaRO","Projects/Past/humaRO"),
          ("Haskell Xcode Plugin","HaskellXcodePlugin")
	]

page :: Html
page = hvSubPage "Hoovy Past Projects" (pastBody +++ pastFooter True)

humaROPage :: Html
humaROPage = hvSubPage "Hoovy Past Projects" (pastBody +++ pastFooter True)

haskellPluginPage :: Html
haskellPluginPage = hvSubPage "Hoovy Past Projects" (pastBody +++ pastFooter True)
