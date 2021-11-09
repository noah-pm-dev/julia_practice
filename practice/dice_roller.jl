printstyled("What type of dice do you want to roll?: "; color = :green)

type = readline()

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