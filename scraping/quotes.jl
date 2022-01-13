using Pkg
Pkg.add("HTTP")
Pkg.add("Gumbo")

using HTTP
using Gumbo

quotesBLOB = HTTP.get("https://quotes.toscrape.com/")
quotesHTML = parsehtml(String(quotesBLOB.body))

body = quotesHTML.root[2]

quote1 = body[1][2][1][1][1]

println(quote1[1].text)
