module NovaEditor (page) where

import Text.Html

import Nova (npPage)
import Shared

pgbody :: Html
pgbody =
--	anchor ! [name "asdfdfa"] << "asdasd"
    p << ""
	+++ center << imageFile (Just (1026 `div` 2, 683 `div` 2)) "editor1"
	+++ blockquote << "The red outline is called the Winding. The Yellow points are called the Steps. The yellow extents from these points are the UV coordinates of the Steps. The Yellow box is the bounds of the winding. Together with the contents applied visually to the winding and other properties, it is called a Part. Here a single Part is selected. The cursor is hiding under the browser panel to the right, where the 'Star' Mutator is highlighted."
	+++ hvHeading "1. The Inspector Panel" inspector
	+++ hvHeading "2. The Browser Panel" browser
	+++ hvHeading "3. The Mouse and Keyboard" mouseKeyboard
	+++ hvHeading "4. Tutorial" spaceHtml
    +++ hvHeading "5. Files" files

inspector =
		hvHeading "1.1 Model" model
	+++ hvHeading "1.2 Selection" select
	+++ hvHeading "1.3 Winding" winding
	+++ hvHeading "1.4 Step" step
	where
	model =
		center << imageFile Nothing "inspectModel" +++
		p << "This is located in the top left of the inspector panel when it is open. Here, one can perform file operations, see global document settings such as grid size and cursor position, layers and their content overview, as well as buttons to toggle view modes and background color. A selection button is here to show how many are selected and out of how many are not. Clicking this button inverts the selection."

	select =
		center << imageFile Nothing "inspectSel" +++
		p << "The rest of the inspector panel depends on what is selected. First, we have buttons for dealing with both multiple selection and single selection. There are buttons for moving the selection up and down by layers as well as selection information in a button which inverts this when clicked."

	winding =
		center << imageFile Nothing "inspectWinding" +++
		p << "We have here the information on a winding when a single one is selected. Here we can edit flags and remove, change stacking order, and edit the parameters of the applied Procedurals, Mutators, and Synthesizers. Below this are buttons to store entire performance stack, as well as freezing if there are only Mutators present."

	step =
		center << imageFile Nothing "inspectStep" +++
		p << "At the bottom of the inspector panel, there is information on the selected step if any. These numbers are in ratio format and are edited as such."

browser = p << "aads"

mouseKeyboard =
	p << "When a step is selected, operations affect this step. When no steps are selected and a winding is selected, operations affect this winding. When nothing is selected, operations that require selection do not operate. These commands below work when the cursor is not within a panel, except mouse dragging and idle mouse motion."
	+++ p ![align "center"] << (strong << "Keyboard Interaction:") +++ commandList [
		("ESC","Clear selection or abort winding creation"),
		("DEL or Backspace","Delete selected parts or steps, or delete text character"),
		("Arrow Keys","Scroll view"),
		("Shift+Arrow Keys", "Translate selected winding or step's UV coordinates"),
		("z", "Toggle fill display (rendering of procedurals)"),
		("w", "Toggle wire display (rendering of winding as lines)"),
		("- or =", "Zoom in or out"),
		("0", "Reset zoom to 100%"),
		("Shift+[ or Shift+]", sg "grid"),
		("[ or ]", sg "cursor"),
		("Space Bar", "Pick up selected; attached to cursor until click"),
		("Shift+Space Bar", "Clone selected; attached to cursor until click"),
		("TAB", "Toggle inspector panel if cursor is on left, Toggle browser panel if on right"),
		("p", "Run engine, for previewing animated procedurals or synthesizers")
        ]
    +++ p ! [align "center"] << (strong << "Keyboard for Common Mutators:") +++ commandList [
		(", or .", "Rotate selected by 15 degrees, negative or positive"),
		("< or >", "Rotate selected around cursor by 15 degrees, negative or positive"),
		("f", "Toggle selected Part as triangle fan or polygon"),
		("c", "Toggle selected Part as autocurve or polygon"),
        ("i", "Invert Widings of selected Parts"),
        ("v or Shift+v", "Rotate order of Winding Steps, forward or backward."),
		("r,g,b,a or Shift+r,g,b,a", "Lower/raise color of selected windings or steps")
		]
	+++ p ! [align "center"] << (strong << "Mouse Interaction:") +++ commandList [
		("Mouse Wheel",sg "cursor"),
		("Shift+Mouse Wheel",sg "grid"),
		("Idle Motion", "Move cursor, Also drag selected if attached to cursor."),
		("Click", "Try to select steps within cursor, if none then try to select windings, if none found, unselect."),
		("Click + Drag", "Drag selected"),
		("Shift + Click + Drag", "Scroll selected UVs"),
		("Double Click", "Begin making a winding"),
		("Right Click", "Finish winding being made; nothing if none"),
		("Shift+Right Click", "Perform selection with winding being made; nothing if none"),
		("Ctrl+Click+Drag", "Begin winding cut tool. (not fully completed)")
		]

	where
	sg s = "Shrink or grow the " ++ s

files =
    p << "" -- ("These files reside in the "+++tt<<"/Novapilot/Art/"+++" directory")
    +++ commandList [
        ("Nova/Art/procs.nhs", "Defaults for procedural palette"),
        ("Nova/Art/synths.nhs", "Defaults for synthesizer palette"),
        ("Nova/Art/mutes.nhs", "Defaults for mutator palette"),
        ("Nova/Art/visuals.nhs", "Visual content dictionary"),
        ("Nova/Art/aurals.nhs", "Aural content dictionary"),
        ("Nova/Art/transforms.nhs", "Mutator geometry dictionary")
    ]

page = npPage "Editor" pgbody
