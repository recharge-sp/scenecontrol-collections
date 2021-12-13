# aff syntax  
`scenecontrol(timing,luna,duration);`  
# required files in Scenecontrol folder  
- char.png  
the image of character you would like to use  
- bg_darken.png  
self explanatory  
# config section explaination  
`DARKEN_DELAY`: Delays x ms after character appears.  
`DARKEN_ALPHA`: Alpha of bg_darken.png. (0\~255)  
`DARKEN_R`: Red tint of bg_darken.png. (0\~255)  
`DARKEN_G`: Green tint of bg_darken.png. (0\~255)  
`DARKEN_B`: Blue tint of bg_darken.png. (0\~255)  
`SHOW_TIMING`: Animation duration for showing character in ms.  
`HIDE_TIMING`: Animation duration for hiding character in ms.  
`MOVE_TIMING`: Interval for character moving up and down in ms.  
`MOVE_THRESHOLD`: Y distance of how much the character should move up and down.  
`CHAR_SCALE`: Scale the character, 1 = 1x, 2 = 2x ..etc.  
`X_OFFSET`: X offset of the character.  
`Y_OFFSET`: Y offset of the character.  
`HIDE_AFTER_END`: Hide character after scenecontrol end. (value can be false true)  
`MOVE_UP_AFTER_SHOW_TRACK`: Move up character to below variable after end of event. (value can be false true)  
`Y_OFFSET_AFTER_SHOWTRACK`: When above variable is true this variable is effective.  
`BIG_AF_VALUE`: big as fuck value, just make sure this value is bigger than your song length.  
