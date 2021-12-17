using REPL.TerminalMenus

## Single Letter Variable List
# a: requested choice for charList, used in charList[a]
# b: requested choice for fortuneQuery, used in fortuneQuery[b]
# C: request choice for rainbowYN, used in rainbowYN[c]



fortuneQuery = ["fortune", "custom text"]

charList = ["apt", "frogs", "bunny", "calvin", "cheese", "rooster", "cow-hiding", "daemon", "cow", "dragon", "dragon-and-cow", "duck", "elephant", "elephant-in-snake", "eyes", "flaming-sheep", "fox", "ghostbusters", "gnu", "hellokitty", "kangaroo", "kiss", "koala", "kosh", "luke-koala", "mech-and-cow", "milk", "moofasa", "moose", "pony", "pony-smaller", "ren", "sheep", "skeleton", "snowman", "stegosaurus", "stimpy", "suse", "three-eyed-cow", "turkey", "turtle", "tux", "unipony", "small-unipony", "vader", "vader-koala", "www" ] # List of built-in cowfiles

rainbowYN = ["YES", "NO"]

charMenu = RadioMenu(charList, pagesize=8) # Define menu for charList
textTypeQuery = RadioMenu(fortuneQuery, pagesize=2) # Define menu for fortuneQuery
rainbowYNPick = RadioMenu(rainbowYN, pagesize=2) # Define menu for rainbowYN
TerminalMenus.config(charset=:unicode) # Set menu to use unicode
b = request("Choose One: ", textTypeQuery) # Request menu textTypeQuery
print("\033[A\e[2K\033[A\e[2K\033[A\e[2K") # Clear previous menu
a = request("Pick a character: ", charMenu) # Request menu charMenu
print("\033[A\e[2K\e[2K\033[A\e[2K\033[A\e[2K\033[A\e[2K\033[A\e[2K\033[A\e[2K\033[A\e[2K\033[A\e[2K\033[A\e[2K")
c = request("Would you like output to be rainbow?", rainbowYNPick) # Request rainbowYNPick menu
print("\033[A\e[2K\033[A\e[2K\033[A\e[2K")


## Translate options the names of which are changed in the choice list.
if (charList[a] == "frogs")
	character = "bud-frogs"
elseif (charList[a] == "rooster")
	character = "cock"
elseif (charList[a] == "cow-hiding")
	character = "cower"
elseif (charList[a] == "cow")
	character = "default"
elseif (charList[a] == "three-eyed-cow")
	character = "three-eyes"
elseif (charList[a] == "small-unipony")
	character = "unipony-smaller"
else
	character = charList[a]
end


baseCMD = ["cowsay", "-f", "$character"]

if (rainbowYN[c] == "YES")
	lolcat = 1
else
	lolcat = 0
end

if (fortuneQuery[b] == "custom text")
	print("Enter custom text: ")
	text = readline()
	push!(baseCMD, "\"$text\"")
	finalCMD = join(baseCMD, " ")
	print("\033[A\e[2K")
	if (lolcat == 1)
		run(pipeline(`sh -c $finalCMD`, `lolcat`))
	else
		run(`sh -c $finalCMD`)
	end
elseif (fortuneQuery[b] == "fortune")
	finalCMD = join(baseCMD, " ")
	if (lolcat == 1)
		run(pipeline(`fortune`, `sh -c $finalCMD`, `lolcat`))
	else
		run(pipeline(`fortune`, `sh -c $finalCMD`))
	end
end
	

