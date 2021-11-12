i = 1 # 'i' is used in while loop
ttl = 0
numOfMax = 0


println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

## Taking ARGS as one string, splitting into substrings, then assigning 'type' and 'amount' variables from substring array

die = ARGS[1] # Assign index 1 of the ARGS variable (stores cmd line args as string array) to the 'die' variable

if (occursin("+", die) == false && count(i->(i=='d'), die) < 2)
    return
else
    printstyled("Do not use any special characters, and only 1 \"d\" in the argument.\n"; color = :red)
    println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    exit(1)
end

dieSplit = replace(die, "d" => "+d") # Insert character to use later for splitting string into substrings

stringSplit = split(dieSplit, "+") # Split string at splitter into substrings

amountString = stringSplit[1] # Assign substring at index 1 to new variable

if (tryparse(Int64, amountString) !== nothing && occursin("-", amountString) == false) # Test if amountString is parseable and is not negative
    return                                                                             # If it is parseable and non-negative, return
else
    printstyled("That is not a valid amount, amount must be a positive integer.\n"; color = :red) # If is not parseable, is negative, or both, print error message
    println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    exit(1)                                                                                       # and exit program
end

amount = parse(Int64, amountString) # Parse amountString substring to Int64

type = stringSplit[2] # Assign substring at index 2 to new variable
##

# Check for invalid type
if (occursin("4", type) == true || occursin("6", type) == true || occursin("8", type) == true || occursin("10", type) == true || occursin("12", type) == true || occursin("20", type) == true)
    return
else
    printstyled("That is not a valid type of die! Valid types are {d4, d6, d8, d10, d12, d20}\n"; color = :red)
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
        println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        exit(1)
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
