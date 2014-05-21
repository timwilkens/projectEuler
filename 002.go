package main

import "fmt"

func main() {
  total, term1, fib := 0
  term2 := 1

  for {
    fib = term1 + term2
    if fib % 2 == 0 {
      total += fib
    }
    term2 = term1
    term1 = fib
   
    if fib > 4000000 {
      break
    }
  }
  fmt.Println(total)
}
