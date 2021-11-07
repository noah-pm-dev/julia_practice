print("Time Between Prints: ")

timestring = readline()
println()
#println(typeof(timestring))
time = parse(Float64, timestring)
#println(typeof(time))
i = 1

while true
    println(big(2)^i)
    global i += 1
    sleep(time)
end