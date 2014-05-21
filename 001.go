package main

import "fmt"

func main() {
  total := 0
  for n := 1; n < 1000; n++ {
    if n % 3 == 0 || n % 5 == 0 {
      total += n
    }
  }
  fmt.Println(total)
}
