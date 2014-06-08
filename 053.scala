def factorial(n: BigInt): BigInt = {
  def loop(x: BigInt, acc: BigInt): BigInt = 
    if (x == 0) acc
    else loop(x - 1, acc * x)
  loop(n, 1)
}

def combinatorial(n: BigInt, r: BigInt) = {
  factorial(n) / (factorial(r) * factorial(n - r))
}

val greaterThan = for {
  n <- (1 to 100)
  r <- (0 to n)
  if combinatorial(n, r) > 1000000
} yield n

println(greaterThan.length)
