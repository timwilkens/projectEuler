class NumObj(val n: Int) {
  val chars = n.toString.toList
  val size = chars.length
}

val positions = List(1,10,100,1000,10000,100000,1000000)

def loop(x: NumObj, count: Int, total: Int): Int =
  if (count > 1000000) total
  else loop(new NumObj(x.n + 1), count + x.size, update(x, count, total))
                                
def update(x: NumObj, count: Int, total: Int): Int = {
  val nums = (1 to x.size).filter(y => positions.exists(z => z == y + count))
  if (nums.isEmpty) total
  else total * x.chars(nums.head - 1).asDigit
}

val answer = loop(new NumObj(1), 0, 1)
println(answer)
