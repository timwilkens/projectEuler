// Imperative Style
def threeOrFive(x: Int) = if ((x % 3 == 0) || (x % 5 == 0)) true else false
var total = 0

for (i <- 3 to 999) {
  if (threeOrFive(i))
    total += i
}

println(total)

// Functional style
total = (3 to 999).filter(s => (s % 3 == 0 || s % 5 == 0)).sum
println(total)
