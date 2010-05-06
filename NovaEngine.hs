module NovaEngine (page) where

import Text.Html
import Shared
import Nova (npPage)

pgbody = blockquote << "..."

page = npPage "Engine" pgbody
