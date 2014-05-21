package main

import "fmt"

func main() {

  x := triangle_num(12349)  
  for n := 12350; ; n++ {
    x += n
    test_divisors(x)
  }
}

func test_divisors(n int) {
  chan1,chan2,chan3,chan4 := make(chan int),make(chan int),make(chan int),make(chan int)

  go check_section(chan1, n, 2, (n / 8))
  go check_section(chan2, n, ((n / 8)), (n / 6))
  go check_section(chan3, n, ((n / 6)), (n / 4))
  go check_section(chan4, n, ((n / 4)), (n / 2))

  divisors := receive(chan1,chan2,chan3,chan4)

  fmt.Println(n, "->", divisors)
  if divisors > 500 {
    fmt.Println(n, "WINNER")
    return
  } 
}

func receive(channels ...chan int) int {

  // All divisible by 1. Start here.
  divisors := 1
  for _,channel := range channels {
    for result := range channel {
      divisors += result
    }
  }
  return divisors
}

func check_section(c chan int, n int, start int, end int) {
  divisors := 0
  for i := start; i <= end; i++ {
    if n % i == 0 {
      divisors ++
    }
  }
  c <- divisors
  close(c)
}

func triangle_num(n int) int {
  if n == 1 {
    return 1
  }
  return n + triangle_num(n - 1)
}
