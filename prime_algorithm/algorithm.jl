open("log.txt", "w") do f

	query = ARGS[1]
	
	queryNum = parse(Int64, query)
	limit = queryNum - 1
	
	if (length(ARGS) < 1 || length(ARGS) > 1) 
		printstyled("Must use only one argument\n"; color = :red)
		exit()
	end
	
	for i in 2:limit
		num = string(i) * "\n"
	        write(f, num)
	end
end

