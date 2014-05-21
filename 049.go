package main

import (
  "fmt"
  "math"
  "strconv"
)

func main () {
  jobs := make(chan Job)
  results := make(chan int)
  done := make(chan int)

  go launchJobs(jobs,results)
  for i := 0; i < 10; i++ {
    go testJobs(jobs,done)
  }
  go waitForEnd(done,results)

  getResults(results)
}

func getResults(results <-chan int) { 
  for result := range results {
    second := result + 3330
    third := second + 3330
    if compareDigits(result,second,third) {
      fmt.Println(result,second,third) 
    }
  }
}

func compareDigits(a,b,c int) bool {
  one := strconv.Itoa(a)
  two := strconv.Itoa(b)
  three := strconv.Itoa(c)
  digits := make(map[string]int)

  for i := 0; i < len(one); i++ {
    digits[string(one[i])] = 1
  }
  for i := 0; i < len(two); i++ {
    if _,ok := digits[string(two[i])]; !ok {
      return false
    }
  }
  for i := 0; i < len(three); i++ {
    if _,ok := digits[string(three[i])]; !ok {
      return false
    }
  }
  return true
}

func waitForEnd(done <-chan int, results chan int) {
  for i := 0; i < 10; i++ {
    <-done
  }
  close(results)
}

func testJobs(jobs <-chan Job, done chan<-int) {
  for job := range jobs {
    job.Do()
  }
  done <- 1
}

func launchJobs(jobs chan<-Job, results chan int) {
  for i := 1001; i < 10000; i = i + 2 {
    jobs <- Job{i,results}
  }
  close(jobs)
}

func (job *Job) Do() {
  start := job.start
  second := start + 3330
  third := second + 3330
  if (second > 9999 || third > 9999) { return }

  if (isPrime(start) && isPrime(second) && isPrime(third)) {
    job.result <- job.start
  }
}

type Job struct {
  start int
  result chan int
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
