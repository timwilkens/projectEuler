val total = (1 to 1000).map(x => BigInt(x).pow(x)).sum.toString.reverse.toList
val ending = (0 to 9).reverse.map(x => total(x)).mkString
println(ending)
