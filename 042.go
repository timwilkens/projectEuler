package main

import (
  "fmt"
  "io/ioutil"
  "strings"
)

func main() {

  words := get_word_list()
  numbers := get_triangle_nums(100)
  total := 0

  for _,word := range words {
    value := value_for_word(word)
    if _,ok := numbers[value]; ok {
      total++
    }
  }
  fmt.Println(total)
}

func value_for_word(s string) int {

  total := 0
  for i := 0; i <= (len(s) - 1); i++ {
    char := string(s[i])
    value := value_for_char(char)
    total += value
  }
  return total
}

func value_for_char(c string) int {

  values := map[string]int{"A":1,"B":2,"C":3,"D":4,"E":5,"F":6,"G":7,"H":8,"I":9,"J":10,"K":11,"L":12,"M":13,"N":14,"O":15,"P":16,"Q":17,"R":18,"S":19,"T":20,"U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26,}

  return values[c]
}

func get_triangle_nums(n int) map[int]int {

  numbers := make(map[int]int)
  for i := 1; i <= n; i++ {
    numbers[((i * (i - 1)) / 2)] = 1
  }
  return numbers
}

func get_word_list() []string {
  data, err := ioutil.ReadFile("042words.dat")
  check(err)
  words := strings.Split(string(data),",")
  for index,word := range words {
    word = strings.Trim(word,"\"")
    word = strings.Trim(word,"\"\n")
    words[index] = word
  }
  return words
}

func check(e error) {
  if e != nil {
    panic(e)
  }
}
