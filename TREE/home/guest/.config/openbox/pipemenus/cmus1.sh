#!/bin/bash
# Openbox Pipe Menu for cmus, adapted 2014 from
# author:Matsuda Shinpei
# Date:March 2011
#
# Openbox Pipe Menu for audacious
# Feel free to change this script as you like.
# Probably, it's not so hard to make rhythembox or other media player control menus like this,
# as far as these media players support the CUI control commands.
# see 'audtool help' for more 
 
if [ ! "$(ps -C cmus -o pid=)" ]; then
    cat <<EOF
<openbox_pipe_menu>
  <item label="Run cmus">
    <action name="Execute">
      <execute>
        lxterminal -e cmus 
      </execute>
    </action>
  </item>
</openbox_pipe_menu>
EOF
else
# if you want to show artist and album name, add next line to just below <openbox_pipe_menu>.
# <separator label="`audtool --current-song-tuple-data artist`  :  `audtool --current-song-tuple-data album`" />
cat <<EOF
<openbox_pipe_menu>
<separator label= "`audtool current-song` (`audtool --current-song-length`)" />
<separator label= "volume `audtool get-volume` %" />
   <item label="Play">
     <action name="Execute">
       <execute>
         audtool playback-play
       </execute>
     </action>
   </item>
   <item label="Pause">
     <action name="Execute">
       <execute>
         audtool playback-pause
       </execute>
     </action>
   </item>
   <item label="Stop">
     <action name="Execute">
       <execute>
         audtool playback-stop
       </execute>
     </action>
   </item>
   <item label="Previous">
     <action name="Execute">
       <execute>
         audtool playlist-reverse
       </execute>
     </action>
   </item>
   <item label="Next">
     <action name="Execute">
       <execute>
         audtool playlist-advance
       </execute>
     </action>
   </item>
   <separator/>
   <item label="Repeat `audtool playlist-repeat-status`">
     <action name = "execute">
       <execute>
         audtool playlist-repeat-toggle
       </execute>
     </action>
   </item>
   <item label="Shuffle `audtool playlist-shuffle-status`">
     <action name = "execute">
       <execute>
         audtool playlist-shuffle-toggle
       </execute>
     </action>
   </item>
   <separator/>
   <item label="Jump to file">
     <action name="Execute">
       <execute>
         audtool jumptofile-show on
       </execute>
     </action>
   </item>
   <item label="Show Window">
     <action name="Execute">
       <execute>
         audtool mainwin-show on always-on-top on
       </execute>
     </action>
   </item>
   <item label="Hide Window">
     <action name="Execute">
       <execute>
         audtool mainwin-show off 
       </execute>
     </action>
   </item>
   <item label="Add files">
     <action name="Execute">
       <execute>
         audtool filebrowser-show on always-on-top on
       </execute>
     </action>
   </item>
   <separator />
   <item label="Set Volume 90%">
     <action name="Execute">
       <execute>
         audtool set-volume 90
       </execute>
     </action>
   </item>
   <item label="Set Volume 75%">
     <action name="Execute">
       <execute>
         audtool set-volume 75
       </execute>
     </action>
   </item> 
   <item label="Equalizer On">
     <action name="Execute">
       <execute>
         audtool equalizer-activate on
       </execute>
     </action>
   </item>
   <item label="Equalizer Off">
     <action name="Execute">
       <execute>
         audtool equalizer-activate off
       </execute>
     </action>
   </item> 
   <item label="Quit Audacious">
     <action name="Execute">
       <execute>
         audtool shutdown
       </execute>
     </action>
   </item>
</openbox_pipe_menu>
EOF
fi
