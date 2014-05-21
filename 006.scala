def square(x: Int) = x * x
val total = square((1 to 100).sum) - (1 to 100).map(square).sum
println(total)
