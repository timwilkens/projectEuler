package main

import (
  "fmt"
  "math"
)

func main() {

  largest := 0
  one := 0
  two := 0

  for a := -999; a < 1000; a++ {
    for b := -999; b < 1000; b++ {
      value := testValues(a,b)
      fmt.Println(value, "=>", a, b)
      if value > largest {
        largest = value
        one = a
        two = b
      }
    }
  }
  fmt.Println(largest)
  fmt.Println(one,"&",two)
  fmt.Println((one * two))
}

func testValues(a,b int) int {

  test := 0
  total := 0
  for {
    if !(isPrime(((test * test) + (a * test) + (b)))) {
      return total
    }
    test++ 
    total++
  }
}

func isPrime(n int) bool {
  if n < 0 { n *= -1 }
  if n == 1 || n == 2 {
    return true
  }

  if math.Mod(float64(n), 2) == 0 {
    return false
  }

  for i := 3.0; i <= math.Floor(math.Sqrt(float64(n))); i += 2.0 {
    if math.Mod(float64(n), i) == 0 {
      return false
    }
  }

  return true
}
