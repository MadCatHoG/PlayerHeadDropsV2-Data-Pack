##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 29, 2018
# Version: 2.0
# Minecraft Version 1.13
# Description:
# Player Head Drop loop Function
##########################################

# Copy the following execute command for new people and replace PlayerIGN for the 
# player you want its head to drop on kill. Don't foget to remove # and do /reload in game.
#execute as @a[name=PlayerIGN,scores={phd.deaths=1..}] run give @a[scores={phd.kills=1..}] player_head{SkullOwner:"PlayerIGN"} 1

execute as @a[name=_MadCat,scores={phd.deaths=1..}] run give @a[scores={phd.kills=1..}] player_head{SkullOwner:"_MadCat", display:{Name:"{\"text\":\"MadCat's Head\"}"}} 1

execute as @a[name=MadCatHoG,scores={phd.deaths=1..}] run give @a[scores={phd.kills=1..}] player_head{SkullOwner:"MadCatHoG"} 1

execute as @a[name=Farriky,scores={phd.deaths=1..}] run give @a[scores={phd.kills=1..}] player_head{SkullOwner:"Farriky"} 1


##########################################
scoreboard players set @a[scores={phd.deaths=1..}] phd.deaths 0
scoreboard players set @a[scores={phd.kills=1..}] phd.kills 0
