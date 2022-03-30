using Printf


function greenPass(input)
	for i in 1:5
		if input[i] == testInput[i]
			lettersChecked["$(input[i])"] += 1
			push!(greenIndex, i)
			@printf("\u001b[42m%s\u001b[49m", input[i])
		else
			@printf("\u001b[1C")
		end
	end
end

function wrongPass(input)
	@printf("\u001b[5D")
	for i in 1:5
		if indexin(i, greenIndex) .== nothing
			if occursin(input[i], join(testInput)) && lettersChecked["$(input[i])"] < lettersUsed["$(input[i])"]
				lettersChecked["$(input[i])"] += 1
				@printf("\u001b[43m%s\u001b[49m", input[i])
			else
				@printf("\u001b[100m%s\u001b[49m", input[i])
			end
		else
			@printf("\u001b[1C")
		end
	end
end


testInput = [char for char in readline()]
#input = [char for char in readline()]
lettersUsed = Dict{String, Any}()
lettersChecked = Dict{String, Any}()
greenIndex = []


#=
These blocks create two dicts. lettersUsed contains the number of each letter in the answer word,
while lettersChecked will contain how many times a letter in the input has been checked.
This is to prevent multiple of one letter in the input being highlighted yellow even if there is only one occurence of it in the answer.
=#
for i in testInput				
	lettersUsed["$i"] = 0
	lettersChecked["$i"] = 0
end

for i in testInput
	lettersUsed["$i"] += 1
end
##

#print("\u001b[1F")


for i in 1:6
	input = [char for char in readline()]
	print("\u001b[1F")
	greenPass(input)
	wrongPass(input)
	println()
	global greenIndex = []
end



#=
for i in 1:5
	if input[i] == testInput[i]
		lettersChecked["$(input[i])"] += 1
		push!(greenIndex, i)
		@printf("\u001b[42m%s\u001b[49m", input[i])
	else
		@printf("\u001b[1C")
	end
end

@printf("\u001b[5D")

for i in 1:5
	if indexin(i, greenIndex) .== nothing
		if occursin(input[i], join(testInput)) && lettersChecked["$(input[i])"] < lettersUsed["$(input[i])"]
			lettersChecked["$(input[i])"] += 1
			@printf("\u001b[43m%s\u001b[49m", input[i])
		else
			@printf("\u001b[100m%s\u001b[49m", input[i])
		end
	else
		@printf("\u001b[1C")
	end
end
=#



#println("\n", indexin(1, greenIndex))
#println(greenIndex)
println("\n", lettersUsed, "\n", lettersChecked)
#test w/ soaps, spool
