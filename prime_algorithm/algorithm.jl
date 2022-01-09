if (length(ARGS) != 1) 
	printstyled("Must use only one argument\n"; color = :red)
	exit()
end


query = ARGS[]

try
	parse(Int64, query)
catch f
	printstyled("Argument must be an integer\n"; color = :red)
	exit()
end


queryNum = parse(Int64, query) # Parse argument to Int64
startPoint = trunc(Int64, (queryNum/2))
println("query: $queryNum; start: $startPoint")


if (queryNum % 2 == 0 && queryNum != 2)
	println("Even numbers cannot be prime!")
	exit(0)
elseif (queryNum == 2)
	println("\n2 is prime!")
	exit(0)
end


for i in 2:(startPoint + 1)
	if i == startPoint + 1
		println("\n$queryNum is prime!")
		exit(0)
	end

	isPrime = try
		Int(queryNum/i)
		true
	catch x
		false
	end

	println("Tried $queryNum/$i")

	if isPrime
		println("\n$queryNum is not prime!")
		exit(0)	
	end

end








#iter = ((queryNum - 2) * (queryNum - 2)) / 2 # Determine how many different pairs of numbers are between the query number and 1 (not including)
#println("Query: ", queryNum)
#println("Iterations: ", iter) # Printing amount of iteratiosn for testing purposes
#sleep(5)
# Make sure only one argument is accepted


#=
for i in 1:iter
	#num = string(i) * "\n"
        #write(f, num)
	limit = queryNum - 1
	println(limit)
	tmpNum1 = rand(2:limit)
	println(tmpNum1)
	tmpNum2 = rand(2:limit)
	println(tmpNum2)
	tmpString = string(tmpNum1) * ", " * string(tmpNum2) * "\n"
	println(tmpString)
	open("log.txt", "a") do io
		write(io, tmpString)
	end
	sleep(0.5)
end
=#
