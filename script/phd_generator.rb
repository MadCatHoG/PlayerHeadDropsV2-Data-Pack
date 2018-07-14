##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 29, 2017
# Version: 2.0
# Description:
#   Ruby code to write the Player Head Drop loop function.
#   This script requires the httparty gem to make API requests to Mojang
# Usage:
#   The accepted parameters are Minecraft IGNs to be parsed and generate the
#   loop function. They need to be separated by spaces (not commas).
#   If no parameters are specified the script will look for the whitelist.json file 
#   in this same folder to parse and generate the loop function.
##########################################

require "httparty"

#Obtains UUID from Mojang's API given a user name
#Returns user's UUID in String format
def getUuid user
	res = HTTParty.post("https://api.mojang.com/profiles/minecraft",
	  { 
	    :body => user.to_json,
	    :verify => false,
		:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
	  })
	if res.parsed_response.count == 0
		p "User #{user} doesn't exist"
		return false
	else 
		return res.parsed_response[0]["id"]
	end
end

#Obtains user's skin texture info from Mojang's API given a UUID
#Returns the encoded64 texture value in String format
def getTexture uuid
	res = HTTParty.get("https://sessionserver.mojang.com/session/minecraft/profile/#{uuid}",
	{
		:verify => false,
		:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  	})
	return res.parsed_response["properties"][0]["value"]
end

#Converts a UUID to the old format (with dashes)
#Returns String
def olduuid uuid
	rf = uuid
	rf.insert(8, "-")
	rf.insert(13, "-")
	rf.insert(18, "-")
	rf.insert(23, "-")
	return rf
end

#Generates an execute command for the Player Head Drop function
#Returns Sting
def genCommand user
	uuid = getUuid user
	if uuid != false
		texture = getTexture uuid
		command = "execute as @a[name="+user+",scores={phd.deaths=1..}] run give @a[scores={phd.kills=1..}] player_head{SkullOwner:{Id:\""+olduuid(uuid)+"\",Name:\""+user+"\",Properties:{textures:[{Value:\""+texture+"\"}]}}} 1"
		#display:{Name:\"{\\\"text\\\":\\\""+user+"'s Head\\\"}\"},
		p "Command generated for "+user
	else
		command = "# User #{user} doesn't exist in Mojang's database"
		p command		
	end

	return command
end

#Writes a function with all the player head textures and commands.
#Needs an Array with all the users IGN.
def writeToFile users,filename="loop.mcfunction"
	f = File.new(filename,"w+")
	f.write("##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 29, 2018
# Version: 2.0
# Minecraft Version 1.13
# Description:
# Player Head Drop loop Function
##########################################
")
	users.each { |user| f.write("\n"); f.write(genCommand user); f.write("\n") }

	f.write("
##########################################
scoreboard players set @a[scores={phd.deaths=1..}] phd.deaths 0
scoreboard players set @a[scores={phd.kills=1..}] phd.kills 0
")
	f.close
	p "Commands generated and written in "+filename
end

#Reads the Minecraft whitelist file if is in the same directory as this file.
#It parses all the users and put them in an Array
#Returns Array with all users in the whitelist
def readWhitelist filename="whitelist.json"
	list = Array.new
	json = JSON.parse File.read(filename)
	#p json
	json.each{ |user| list << user["name"] }
	return list
end

#users = ["_MadCat","MadCatHoG"]
#writeToFile users

if ARGV[0] == nil
	p "No parameters, reading from whitelist..."
	if File.file?("whitelist.json")
		writeToFile(readWhitelist)
	else
		p "Can't find the whitelist file."
	end
else
	p "Parameters found, Parsing names..."
	users = ARGV
	writeToFile users
end

