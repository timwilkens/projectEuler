def allPermutations(x: Int): List[Int] = {
  def loop(xs: List[Char], size: Int, soFar: List[Int]): List[Int] =
    if (size == 0) soFar
    else loop(xs.tail ::: List(xs.head), 
              size - 1, 
              xs.map(y => y.asDigit).mkString.toInt :: soFar) 

  val nums = x.toString.toList
  loop(nums, nums.size, List())
}

def checkPermutations(xs: List[Int], primes: List[Int]): Boolean =
  if (xs.isEmpty) true
  else if (primes.contains(xs.head)) checkPermutations(xs.tail, primes)
  else false

def isPrime(x: Int): Boolean = {
  def loop(divisor: Int, n: Int): Boolean = 
    if (divisor > scala.math.sqrt(n)) true
    else if (n % divisor == 0) {
      false
    }
    else loop(divisor + 1, n)
 
  loop(2, x)
}

println("Starting up")
val primes = (2 until 1000000).filter(x => isPrime(x)).toList
println("Done with primes")
val answer = primes.filter(p => checkPermutations(allPermutations(p), primes)).size
println(answer)
