curl -o /home/$USER/Music/Shrek.mp4 "https://cdn.discordapp.com/attachments/723258310559662160/1207047699510067340/shrek.mp4-ex=65de39c5&is=65cbc4c5&hm=e9544b5ef72c3812f31054b44917fd5fb76ec96019e97cd60ce8fbd593551952&"

pkill ft_lock; ft_lock

export PATH="/sgoinfre/goinfre/Perso/aboyreau/usr/bin:$PATH"
export LD_LIBRARY_PATH="/sgoinfre/goinfre/Perso/aboyreau/usr/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/sgoinfre/goinfre/Perso/aboyreau/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"

vlc --video-on-top --no-video-deco --play-and-exit --fullscreen --preferred-resolution 1080 ~/Music/shrek.mp4 & 
sleep 0.3

window_id=`xwininfo -name "shrek.mp4 - VLC media player" | awk '/Window id:/{print $4}'`

/sgoinfre/goinfre/Perso/aboyreau/usr/bin/xdotool set_window --overrideredirect 1 $window_id
/sgoinfre/goinfre/Perso/aboyreau/usr/bin/xdotool windowunmap --sync $window_id
/sgoinfre/goinfre/Perso/aboyreau/usr/bin/xdotool windowmap --sync $window_id
/sgoinfre/goinfre/Perso/aboyreau/usr/bin/xdotool windowraise $window_id

while xwininfo -name ft_lock >/dev/null 2>&1; do
    sleep 0.2
done
pkill vlc
