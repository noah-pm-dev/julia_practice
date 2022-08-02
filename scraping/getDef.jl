using Cascadia, Gumbo, HTTP

function getDef(searchTerm)
	selector = sel"section.css-109x55k"
	selector2 = sel"div.e1q3nk1v2"
	selector3 = sel"span.e1q3nk1v1"	
	selector4 = sel"span.luna-pos"
	selector5 = sel"span.pos"	
	selector6 = sel"span.label"
	selector7 = sel"span.luna-label"

        url = "https://www.dictionary.com/browse/$searchTerm" 
        pageGet = HTTP.get(url)
        page = parsehtml(String(pageGet.body))
        body = page.root[2] 
        selector = sel"section.css-109x55k"
        sectionList = eachmatch(selector, body)
	println(typeof(sectionList))
	
	for i in eachindex(sectionList)
		sect = sectionList[i]
			
		
		#println("\nSECT:")
		#println(sect, "\n\ntypeof sect: ", typeof(sect))
		

		println("\n\n--------------------")
		
		grammarLP = eachmatch(selector4, sect)
		grammarP = eachmatch(selector5, sect)
		label = eachmatch(selector6, sect)
		labelItalic = eachmatch(selector7, sect)
		defs = eachmatch(selector2, sect)
		
		try
			print(Gumbo.text(grammarLP[1]))
		catch e
			print(Gumbo.text(grammarP[1]))
		end

		try
			println(" ", Gumbo.text(label[1]))
		catch e
			try
				println(" ", Gumbo.text(labelItalic[1]))
			catch x
				print("\n")
			end
		end

		for i in defs
			println("> ", i.attributes["value"], ": ", Gumbo.text(eachmatch(selector3, i)[1]))
		end
		
		
	end
	

	
	
end

#=
print("Type a word: ")
query = readline()
println()
=#

getDef(ARGS[1])
