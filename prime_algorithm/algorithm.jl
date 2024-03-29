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
endPoint = trunc(Int64, (queryNum/2))
println("query: $queryNum")


if (queryNum % 2 == 0 && queryNum != 2)
	println("Even numbers cannot be prime!")
	exit(0)
elseif (queryNum == 2)
	println("\n2 is prime!")
	exit(0)
elseif (queryNum % 5 == 0 && queryNum != 5)
	println("$queryNum % 5 is equal to 0\n$queryNum is not prime!")
	exit(0)
end


for i in 2:(endPoint + 1)
	if i == endPoint + 1
		println("\n$queryNum is prime!")
		exit(0)
	end
	
	if i % 2 == 0
		continue
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

