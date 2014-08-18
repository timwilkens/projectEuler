package main

import (
		"fmt"
)

/*
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/

func sumOfDivisors(n int) int {
	sum := 0
	for i := 2; i < n; i++ {
		if n % i == 0 {
			sum += i
		}
	}
	return sum
}

func isAbundant(n int) bool {
	if sumOfDivisors(n) > n {
		return true
	} else {
		return false
	}
}

func main() {
	abundantSums := make(map[int]bool)
	abundants := make([]int, 0)
	total := 0
	for i := 1; i <= 28123; i++ {
		if isAbundant(i) {
			abundants = append(abundants, i)
			for _, k := range abundants {
				abundantSums[k + i] = true
			}
		}

		if _,ok := abundantSums[i]; !ok {
			total += i
		}
	}
	fmt.Println(total)
}