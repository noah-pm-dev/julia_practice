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

dieSplit = replace(die, "d" => "+d+") # Insert character to use later for splitting string into substrings

stringSplit = split(dieSplit, "+") # Split string at splitter into substrings

amountString = stringSplit[1] # Assign substring at index 1 to new variable

try
    parse(Int64, amountString)
catch e
    printstyled("That is not a valid amount, amount must be a positive integer.\n"; color = :red)
    println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    exit(1)
end


#=
if (tryparse(Int64, amountString) !== nothing && occursin("-", amountString) == false) # Test if amountString is parseable and is not negative
    return                                                                             # If it is parseable and non-negative, return
else
    printstyled("That is not a valid amount, amount must be a positive integer.\n"; color = :red) # If is not parseable, is negative, or both, print error message
    println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    exit(1)                                                                                       # and exit program
end
=#
amount = parse(Int64, amountString) # Parse amountString substring to Int64

maxString = stringSplit[3] # Assign substring at index 3 to new variable
max = parse(Int64, maxString)
##




## Number generating and counting # of max rolls

function roll(upper)
    global num = rand(1:upper)
    println(num)
    if (num == upper)
        global numOfMax += 1
    end
    return num
end

## Main loop

while (i <= amount)
    roll(max)
    global i += i
end
##

## Printing final calculations

printstyled("Total: "; color = :green) # Print combined total
println(ttl)
printstyled("Number of maximum rolls: "; color = :green) # Print number of highest possible rolls
println(numOfMax)

println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
