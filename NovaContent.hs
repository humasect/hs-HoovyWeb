module NovaContent (page) where

import Text.Html

import Shared
import Nova (npPage)

pgbody :: Html
pgbody = blockquote << "The Nova project's content system consists of a few things. As seperate pieces they are quite simple, but working together they maintain profound amounts of both potential and realisation."
	+++ hvHeading "1. Editing" editing
	+++ hvHeading "2. Games" games
	+++ hvHeading "3. Procedurals, Mutators, Synthesizers" renderingInfo
	+++ hvHeading "4. Directory Layout" dirLayout
	+++ hvHeading "5. Art and Content" artAndContent
	+++ hvHeading "6. Other Files" otherFiles

editing :: Html
editing =
	p << "Aside from pixel images and wave tables, which are made externally, the Editor is used to create:"
	+++ bulletList editMakes
	+++ p << "...Which are all variations of using the powerful editing primitive called a 'Part' which are stored in a simple list called a model; of which can be also spawned or imported recursively within other models. These Parts are the building blocks for all content and otherwise data-driven aspects of Novapilot. A Part is simply a winding of vertices with associated content, custom tags, geometry information, and layer information."
	+++ p << ""
	where
	editMakes = [
		"Polygons",
		"Curves",
		"Circles, Lines; convex or concave Hulls",
		"Textures and Images by vector modeling",
		"Levels and Intelligent Model Composition",
		"User Interfaces",
		"Animated Sequences",
		"Sound Effect and Music Composition, Note Paths, Synthesis Parameters",
		"Collision Maps, Logic Paths, Triggers",
		"... And any other use for the models themselves or their contents as intelligent variables"
		]

games =
	p << "(A Game is the meeting place of models, content, logic, and user input. The Editor is also a game.)"

renderingInfo =
	p << "A language implemented in a recursively composable Haskell type was developed specifically for the ability to compose and transform OpenGL commands. They are called 'Drawings'. These Drawings are used internally by the engine as well as for the use of what are called 'Procedurals', which are essentially programmable ways to draw Parts. For example Gradient, Grid, Clipped, etc. The 'Winding' is the actual geometry itself of a given Part. A 'Mutator' is also a recursively composable language for the purpose of transforming the Windings of the Parts. This is summarized after this example, where execution is solved in order from bottom to top:"
	+++ commandList [
		("Proc (Gradient North)", "Render again, after all 5 mutations, as a gradient going north."),
		("Trans (Many [FlipX,FlipY,Invert])","Perform these 3 mutations, left to right."),
		("Proc Default", "Render the part using Default procedure, scaled then rotated."),
		("Trans (Rotate 45)","Rotate by 45 degrees."),
		("Trans (Multiply 2.0)","Scale by 2"),
		("<intial winding>","As created and seen in the editor.")
		]
	+++ p << "Here are two examples, where the original winding can also be seen, as colored lines and points:"
	+++ imageFile (Just (456 `div` 2,326 `div` 2)) "example1"
	+++ spaceHtml
	+++ imageFile (Just (636 `div` 2,656 `div` 2)) "example2"
	+++ rawDualList tt tt ([
		"Trans (AutoCurve 8)",
		"Proc (LightHead 0 0)",
		"Trans (Multiply (1.5,1.5))",
		"Proc (LightTail 0 0)",
		"Trans FlipX",
		"Proc (LightTail 0 0)"]
		`zip` [
		"Proc (LightTail 0 0)",
		"Trans (Multiply (1.5,1.5))",
		"Proc (LightTail 0 0)",
		"Trans (Multiply (1.5,1.5))",
		"Proc (LightHead 0 0)",
		"Trans (AutoCurve 8)",
		"Proc (LightTail 0 0)"])
	+++ p << "This same method is used for developing Synthesizers; which are analogous to Procedurals but for synthesizing audio rather than video."
	+++ bulletList [
		"A model is a list of Parts.",
		"A Part is the holy primitive - the meeting place of a Winding, a list of Contents",
		"A Part contains also other information such as layering and tagging.",
		"A Winding is a list of Steps,",
		"Steps are the controls points of a Winding.",
		"Contents of a Part is a visual or aural performance of a Part; Mutators with either Procedurals or Synthesizers"]

dirLayout :: Html
dirLayout =
	commandList [
		("Novapilot/", "The root path; located by default in user $HOME directory"),
		("Novapilot/Art/", "Raw art files (.png, .wav, Editor .model; see below), and .nhs scripts"),
		("Novapilot/Content/", "The compiled Art resources, see below."),
		("Novapilot/Web/", "The source for these web pages."),
		("Novapilot/Source/", "Shared source files and boot sources"),
		("Novapilot/Source/Nova/", "All core sources reside here. 'Dev.hs' is the only link to '<game>' sources."),
		("Novapilot/Source/<game>/", "Game-specific sources. Imports from 'Nova' sources."),
		("Novapilot/*.hs", "Seperated sources by license conflict(s)"),
		("Novapilot/build/", "The output from both Web and Source builds"),
		("Novapilot/Source/TODO", "Internal developer documentation")
		]

artAndContent =
	p << ("Type in '"+++(tt<<"make content")+++"' in the root path to create the seperate tool called BuildContent to compile all of the Art files made from external packages into the files found in the Content directory for use with Novapilot. uncompressed PNG files become NVI, uncompressed WAV files become NVS, and the Editor model files become NVM. Note that the Editor saves .model files, and compiles them automatically into NVM.")
	+++ p << "BuildContent also supports converting from a specific version of older model formats."

otherFiles =
	commandList [
		("Novapilot/novapilot.el", "Emacs mode for Novapilot-specific code editing."),
		("Novapilot/novapilot_export.py", "(unused) Blender Python script for models."),
		("Novapilot/Source/Makefile (make.bat)", "Used to compile engine, editor, shell, and Haddock docs"),
		("Novapilot/Makefile (make.bat)", "Used for BuildContents and cleaning up."),
		("Novapilot/attic/", "Old sources and prototypes"),
		("Novapilot/_darcs/", "Darcs repository")
		]

page :: Html
page = npPage "Content" pgbody
