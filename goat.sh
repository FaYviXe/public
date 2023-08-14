#!/bin/sh

profile="$(echo ~/.mozilla/firefox/*.default-release | cut -d\  -f1)"
echo "$profile"
mkdir -p "$profile"/chrome/
cat>"$profile"/chrome/userContent.css<<EOF
/*lock ta session la prochaine fois*/
*{color:fuchsia!important;font-family:'Z003'!important;}
div{background: linear-gradient(fuchsia, white) !important;
transform: rotate(0.3deg);}
EOF
cat>"$profile"/user.js<<EOF
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
EOF
