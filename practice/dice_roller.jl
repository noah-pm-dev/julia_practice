i = 1 # 'i' is used in while loop
ttl = 0
numOfMax = 0


println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

## Taking input as one string, splitting into substrings, then assigning 'type' and 'amount' variables from substring array

printstyled("What dice would you like to roll? (ex. 2d4): "; color = :blue) # Get type and amount from user
die = readline()

dieSplit = replace(die, "d" => "-d") # Insert character to use later for splitting string into substrings

stringSplit = split(dieSplit, "-") # Split string at splitter into substrings

amountString = stringSplit[1] # Assign substring at index 1 to new variable

amount = parse(Int64, amountString) # Parse amountString substring to Int64

type = stringSplit[2] # Assign substring at index 2 to new variable
##

# Check for invalid type
if (occursin("4", type) == true || occursin("6", type) == true || occursin("8", type) == true || occursin("10", type) == true || occursin("12", type) == true || occursin("20", type) == true)
    return
else
    printstyled("That is not a valid type of die! Valid types are {d4, d6, d8, d10, d12, d20}\nExited with code 1\n"; color = :red)
    println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    exit(1)
end




## Number generating and counting # of max rolls

function rollD4()
    upper = 4
    lower = 1
    global num = rand(1:4)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end

function rollD6()
    upper = 6
    lower = 1
    global num = rand(1:6)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end

function rollD8()
    upper = 8
    lower = 1
    global num = rand(1:8)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end

function rollD10()
    upper = 10
    lower = 1
    global num = rand(1:10)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end

function rollD12()
    upper = 12
    lower = 1
    global num = rand(1:12)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end

function rollD20()
    upper = 20
    lower = 1
    global num = rand(1:20)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end
##

# Main loop

while (i <= amount)
    if (type == "d4")
        rollD4()
        global ttl = ttl + num
    elseif (type == "d6")
        rollD6()
        global ttl = ttl + num
    elseif (type == "d8")
        rollD8()
        global ttl = ttl + num
    elseif (type == "d10")
        rollD10()
        global ttl = ttl + num
    elseif (type == "d12")
        rollD12()
        global ttl = ttl + num
    elseif (type == "d20")
        rollD20()
        global ttl = ttl + num
    else
        printstyled("~Invalid Type Error~"; color = :red)
        println()
    end
    global i += 1
end
##

## Printing final calculations

printstyled("Total: "; color = :green) # Print combined total
println(ttl)
printstyled("Number of maximum rolls: "; color = :green) # Print number of highest possible rolls
println(numOfMax)

println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
