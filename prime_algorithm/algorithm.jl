
query = ARGS[1]

queryNum = parse(Int64, query) # Parse argument to Int64
iter = ((queryNum - 2) * (queryNum - 2)) / 2 # Determine how many different pairs of numbers are between the query number and 1 (not including)
println("Iterations: ", iter) # Printing amount of iteratiosn for testing purposes

# Make sure only one argument is accepted
if (length(ARGS) < 1 || length(ARGS) > 1) 
	printstyled("Must use only one argument\n"; color = :red)
	exit()
end

for i in iter
	#num = string(i) * "\n"
        #write(f, num)
	limit = queryNum - 1
	tmpNum1 = rand(2:limit)
	tmpNum2 = rand(2:limit)
	tmpString = string(tmpNum1) * ", " * string(tmpNum2)
	
	open("log.txt", "a") do io
		write(io, tmpString)
	end
	
end

