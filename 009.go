package main

import "fmt"

func main() {

  for a := 150; a < 400; a++ {
    for b := a + 1; b < 400; b++ {
      for c := b + 1; c < 500; c++ {
        fmt.Println("Trying", a, b, c)
        if a + b + c == 1000 {
          if ((a * a) + (b * b)) == (c * c) {
            fmt.Println(a*b*c)
            return
          }
        }
      }
    }
  }
}
