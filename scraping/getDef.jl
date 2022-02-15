using Cascadia, Gumbo, HTTP

function getDef(searchTerm)
	selector = sel"section.css-109x55k"
	selector2 = sel"div.e1q3nk1v2"
	selector3 = sel"span.e1q3nk1v1"	
	selector4 = sel"span.luna-pos"
	selector5 = sel"span.pos"	

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
		
		grammerLP = eachmatch(selector4, sect)
		grammerP = eachmatch(selector5, sect)
		defs = eachmatch(selector2, sect)
		
		try
			println(Gumbo.text(grammerLP[1]))
		catch e
			exit(0)
		end

		#=		
		try
			println(Gumbo.text(grammerLP[1]))
		catch e
			println(Gumbo.text(grammerP[1]))
		end
		=#		

		for i in defs
			println(i.attributes["value"], ": ", Gumbo.text(eachmatch(selector3, i)[1]))
		end
		
		#println("DEFS: ")
		#println("typeof defs: ", typeof(defs))
		
	end
	

	#println(sectionList)
	
	
end

print("Type a word: ")
query = readline()
println()


getDef(query)
