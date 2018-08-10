##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 29, 2018
# Version: 2.0
# Minecraft Version 1.13
# Description:
# Installs Player Head Drop Function
##########################################

scoreboard objectives add phd.kills playerKillCount
scoreboard objectives add phd.deaths deathCount

gamerule commandBlockOutput false
gamerule sendCommandFeedback false

tellraw @a ["",{"text":"Player Head Drops v2.0","bold":true,"color":"red"},{"text":" ","bold":true,"color":"green"},{"text":"by ","color":"green"},{"text":"MadCat","bold":true,"color":"green","underlined":true,"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Click to check out MadCat on YouTube","color":"aqua"}]}},"clickEvent":{"action":"open_url","value":"https://youtube.com/MadCatHoG"}},{"text":" (Installed)","italic":true,"color":"green"}]