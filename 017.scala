val numList = for (n <- 1 to 1000)
  yield { n.toString.toList }

val numValues = for (chars <- numList) yield {
  if (chars.length == 1) {
    valueOne(chars(0))
  } else if (chars.length == 2) {
    parseTwoDigit(chars)
  } else if (chars.length == 3) {
    parseThreeDigit(chars)
  } else {
    11  // One thousand
  }
}

println(numValues.sum)

def parseTwoDigit (chars: List[Char]): Int = 
  if (chars(0) == '1') {  // twelve
    valueTeens(chars(1))
  } else if (chars(1) == '0') { // twenty
    valueTwo(chars(0))
  } else if (chars(0) == '0') {
    valueOne(chars(1))
  } else { // twenty one
    valueTwo(chars(0)) + valueOne(chars(1))
  }

def parseThreeDigit (chars: List[Char]): Int = 
  if (chars(2) == '0' && chars(1) == '0') {
    valueOne(chars(0)) + 7
  } else {
    valueOne(chars(0)) + 7 + 3 + parseTwoDigit(chars.tail)
  }

def valueOne(c: Char): Int = c match {
  case '1' => 3
  case '2' => 3
  case '3' => 5
  case '4' => 4
  case '5' => 4
  case '6' => 3
  case '7' => 5
  case '8' => 5
  case '9' => 4
}

def valueTeens(c: Char): Int = c match {
  case '0' => 3
  case '1' => 6
  case '2' => 6
  case '3' => 8
  case '4' => 8
  case '5' => 7
  case '6' => 7
  case '7' => 9
  case '8' => 8
  case '9' => 8
}
  
def valueTwo(c: Char): Int = c match {
  case '1' => 3
  case '2' => 6
  case '3' => 6
  case '4' => 5
  case '5' => 5
  case '6' => 5
  case '7' => 7
  case '8' => 6
  case '9' => 6
}
