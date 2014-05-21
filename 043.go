package main

import (
  "fmt"
  "strconv"
)

func main() {

  list := pandigitals()
  total := 0
  
  for _,value := range list {
    num := value.a
    stringify := strconv.Itoa(num)
    if len(stringify) == 9 {
      stringify = "0" + stringify
    }
    digit2,_ := strconv.Atoi(string(stringify[1]) + string(stringify[2]) + string(stringify[3]))
    digit3,_ := strconv.Atoi(string(stringify[2]) + string(stringify[3]) + string(stringify[4]))
    digit4,_ := strconv.Atoi(string(stringify[3]) + string(stringify[4]) + string(stringify[5]))
    digit5,_ := strconv.Atoi(string(stringify[4]) + string(stringify[5]) + string(stringify[6]))
    digit6,_ := strconv.Atoi(string(stringify[5]) + string(stringify[6]) + string(stringify[7]))
    digit7,_ := strconv.Atoi(string(stringify[6]) + string(stringify[7]) + string(stringify[8]))
    digit8,_ := strconv.Atoi(string(stringify[7]) + string(stringify[8]) + string(stringify[9]))
    fmt.Println(num ,"->", digit2)

    if ! (digit2 % 2 == 0) { continue }
    if ! (digit3 % 3 == 0) { continue }
    if ! (digit4 % 5 == 0) { continue }
    if ! (digit5 % 7 == 0) { continue }
    if ! (digit6 % 11 == 0) { continue }
    if ! (digit7 % 13 == 0) { continue }
    if ! (digit8 % 17 == 0) { continue }
    total += num
  }
  fmt.Println(total)
}

type x struct {
  a int
}


func pandigitals() []x {
  nums := []string{"0","1","2","3","4","5","6","7","8","9"}

  pandigitals := make([]x,0,0)
  index := 0
  for _,a := range nums {
    fmt.Println(a)
    defined := make(map[string]int)
    defined[a] = 1
    for _,b := range nums {
      if b == a { continue }
      for _,c := range nums {
        if c == b || c == a { continue }   
          for _,d := range nums {
            if d == c || d == b || d == a { continue }
            for _,e := range nums {
              if e == d || e == c || e == b || e == a { continue }
              for _,f := range nums {    
                if f == e || f == d || f == c || f == b || f == a { continue }
                for _,g := range nums {
                  if g == f || g == e || g == d || g == c || g == b || g == a { continue }
                  for _,h := range nums {
                    if h == g || h == f || h == e || h == d || h == c || h == b || h == a { continue }
                    for _,i := range nums {
                      if i == h || i == g || i == f || i == e || i == d || i == c || i == b || i == a { continue}
                      for _,j := range nums {
                        if j == i || j == h || j == g || j == f || j == e || j == d || j == c || j == b || j == a { continue}
                          number := a+b+c+d+e+f+g+h+i+j
                          intify,_ := strconv.Atoi(number)
                          pandigitals = append(pandigitals, x{intify})
                          index++
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return pandigitals
}
