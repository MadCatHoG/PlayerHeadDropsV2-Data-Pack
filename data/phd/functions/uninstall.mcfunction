##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 29, 2018
# Version: 2.0
# Minecraft Version 1.13
# Description:
# Disables Player Head Drop data pack and
# clears all scoreboards
##########################################

datapack disable "file/PlayerHeadDropsV2.zip"
scoreboard objectives remove phd.kill
scoreboard objectives remove phd.deaths

tellraw @a ["",{"text":"Player Head Drops v2.0","bold":true,"color":"red"},{"text":" ","bold":true,"color":"green"},{"text":"by ","color":"green"},{"text":"MadCat ","bold":true,"color":"green"},{"text":"(Uninstalled/Disabled)","italic":true,"color":"green"},{"text":"\nVisit ","color":"green"},{"text":"www.youtube.com/MadCatHoG","bold":true,"color":"aqua","clickEvent":{"action":"open_url","value":"https://youtube.com/MadCatHoG"}}]
tellraw @a ["",{"text":"To install again use the "},{"text":"/datapack enable","italic":true},{"text":" command"}]