if (length(ARGS) != 1) 
	printstyled("Must use only one argument\n"; color = :red)
	exit()
end

query = ARGS[]

queryNum = parse(Int64, query) # Parse argument to Int64
iter = ((queryNum - 2) * (queryNum - 2)) / 2 # Determine how many different pairs of numbers are between the query number and 1 (not including)
println("Query: ", queryNum)
println("Iterations: ", iter) # Printing amount of iteratiosn for testing purposes
sleep(5)
# Make sure only one argument is accepted


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

