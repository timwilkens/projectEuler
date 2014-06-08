val source = scala.io.Source.fromFile("013nums.dat").getLines
val nums = source.map(BigInt(_)).sum.toString.toList.take(10)
val first10 = (nums foldLeft "")(_ + _)
println(first10)
