package main

import "fmt"

//That brute force.

func main() {

  head := 75
  a :=  []int{95,64}
  b :=  []int{17,47,82}
  c :=  []int{18,35,87,10}
  d :=  []int{20,4,82,47,65}
  e :=  []int{19,1,23,75,3,34}
  f :=  []int{88,2,77,73,7,63,67}
  g :=  []int{99,65,4,28,06,16,70,92}
  h :=  []int{41,41,26,56,83,40,80,70,33}
  i :=  []int{41,48,72,33,47,32,37,16,94,29}
  j :=  []int{53,71,44,65,25,43,91,52,97,51,14}
  k :=  []int{70,11,33,28,77,73,17,78,39,68,17,57}
  l :=  []int{91,71,52,38,17,41,91,43,58,50,27,29,48}
  m :=  []int{63,66,4,68,89,53,67,30,73,16,69,87,40,31}
  n :=  []int{4,62,98,27,23,9,70,98,73,93,38,53,60,4,23}

  //lines := [][]int{a,b,c,d,e,f,g,h,i,j,k,l,m,n}

  largest := 75
  for one,valueone := range a {
    for two, valuetwo := range b {
      if not_proximity(one,two){ continue } 
      for three, valuethree := range c {
        if not_proximity(two,three){ continue } 
        for four, valuefour := range d {
          if not_proximity(three,four){ continue } 
          for five, valuefive := range e {
            if not_proximity(four,five){ continue } 
            for six, valuesix := range f {
              if not_proximity(five,six){ continue } 
              for seven, valueseven := range g {
                if not_proximity(six,seven){ continue } 
                for eight, valueeight := range h {
                  if not_proximity(seven,eight){ continue } 
                  for nine, valuenine := range i {
                    if not_proximity(eight,nine){ continue } 
                    for ten, valueten := range j {
                      if not_proximity(nine,ten){ continue } 
                      for eleven, valueeleven := range k {
                        if not_proximity(ten,eleven){ continue } 
                        for twelve, valuetwelve := range l {
                          if not_proximity(eleven,twelve){ continue } 
                          for thirteen, valuethirteen := range m {
                            if not_proximity(twelve,thirteen){ continue } 
                            for fourteen, valuefourteen := range n {
                              if not_proximity(thirteen,fourteen){ continue } 
                              sum := valueone + valuetwo + valuethree + valuefour + valuefive + valuesix + valueseven + valueeight + valuenine + valueten + valueeleven + valuetwelve + valuethirteen + valuefourteen + head
                              if sum > largest {
                                largest = sum
                                fmt.Println("New largest:", sum)
                                fmt.Println(one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen)
                                fmt.Scanln()
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
          }
        }
      }
    }
  }
  fmt.Println(largest)
}

func not_proximity(a,b int) bool {
  if ((a + 1) == b) || (a == b) {
    return false
  } else {
    return true
  }
}
