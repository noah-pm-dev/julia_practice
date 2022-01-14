using Pkg
Pkg.add("HTTP")
Pkg.add("Gumbo")
Pkg.add("Cascadia")

i = 1
a = 1

using HTTP, Gumbo, Cascadia




for a in 1:10
	pageNum = "https://quotes.toscrape.com/page/$a"
	pageGet = HTTP.get(pageNum)
	page = parsehtml(String(pageGet.body))
	body = page.root[2]
	selector = Selector("div.quote")
	quotes = eachmatch(selector, body)
	printstyled("Listing quotes on page: $a\n"; color = :green)
	for i in eachindex(quotes)
		println("===============")
		
		a = Selector("span.text")
		_quote = Gumbo.text(eachmatch(a, quotes[i])[1])		
		printstyled("Quote:\n$_quote\n"; color = :blue)

		b = Selector("small.author")
		author = Gumbo.text(eachmatch(b, quotes[i])[1])
		printstyled("By: $author\n"; color = :blue)
	
		println("===============")
	end
end
