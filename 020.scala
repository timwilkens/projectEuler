def factorial(x: BigInt): BigInt = {
  def loop(n: BigInt, total: BigInt): BigInt = 
    if (n == 0) total
    else loop(n - 1, total * n)

  loop(x, 1)  
}

val solution = factorial(100).toString.toList.map(x => x.asDigit).sum
println(solution)
