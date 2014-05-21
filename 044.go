package main

import "fmt"
import "math"

func main () {

  list := list_pents(3000)

  for key1,_ := range list {
    for key2,_ := range list {
      if key1 == key2 { continue }
      sum := key1 + key2
      difference := math.Abs(float64(key1 - key2))
      diff := int(difference)
      if _,ok := list[sum]; ok {
        if _,ok2 := list[diff]; ok2{
          fmt.Println(key1,key2, "->", diff)
        }
      }
    }
  }
}

func calc_pent(n int) int {
  return (n * ((3 * n) - 1)) / 2
}

func list_pents(n int) map[int]int {
  pents := make(map[int]int)
  for i := 1; i <= n; i++ {
    pents[calc_pent(i)] = 1
  }
  return pents
}
