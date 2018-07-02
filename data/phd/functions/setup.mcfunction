##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 29, 2018
# Version: 2.0
# Minecraft Version 1.13
# Description:
# Installs Player Head Drop Function
##########################################

scoreboard objectives add phd.kill playerKillCount
scoreboard objectives add phd.deaths deathCount

gamerule commandBlockOutput true
gamerule sendCommandFeedback true

tellraw @a ["",{"text":"Player Head Drops v2.0","bold":true,"color":"red"},{"text":" ","bold":true,"color":"green"},{"text":"by ","color":"green"},{"text":"MadCat ","bold":true,"color":"green"},{"text":"(Installed)","italic":true,"color":"green"},{"text":"\nVisit ","color":"green"},{"text":"www.youtube.com/MadCatHoG","bold":true,"color":"aqua","clickEvent":{"action":"open_url","value":"https://youtube.com/MadCatHoG"}}]