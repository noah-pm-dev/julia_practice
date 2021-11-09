i = 1 # 'i' is used in while loop
ttl = 0
numOfMax = 0

println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

printstyled("How many dice would you like to roll?: "; color = :blue) # Get amount of dice as string from user
amount_string = readline()

amount = parse(Int64, amount_string) # Parse amount to Int64

printstyled("What type of dice do you want to roll?: "; color = :green) # Get type of dice from user
type = readline()

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

printstyled("Total: "; color = :green) # Print combined total
println(ttl)
printstyled("Number of maximum rolls: "; color = :green) # Print number of highest possible rolls
println(numOfMax)

println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
