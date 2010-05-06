module About (page) where

import Text.Html

import Shared
import Hoovy (hvFooter)

pgbody :: Html
pgbody =
    p << ("asdjasdoijaiosdjaoijsdaiosjdoaisjdoiajdojaosijasdoijads")


page :: Html
page = hvSubPage "About Hoovy" (pgbody +++ hvFooter True)
