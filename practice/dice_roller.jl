i = 1 # 'i' is used in while loop

printstyled("What type of dice do you want to roll?: "; color = :green) # Get type of dice from user
type = readline()

printstyled("How many dice would you like to roll?: "; color = :blue) # Get amount of dice as string from user
amount_string = readline()

amount = parse(Int64, amount_string) # Parse amount to Int64
println(amount)


while (i < amount)
    if (type == "d4")
        println(rand(1:4))
    elseif (type == "d6")
        println(rand(1:6))
    elseif (type == "d8")
        println(rand(1:8))
    elseif (type == "d10")
        println(rand(1:10))
    elseif (type == "d12")
        println(rand(1:12))
    elseif (type == "d20")
        println(rand(1:20))
    else
        printstyled("~Invalid Type Error~"; color = :red)
        println()
    end
    global i += 1
end