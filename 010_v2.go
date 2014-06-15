package main

import (
        "fmt"
        "container/heap"
)
// An implementation of the Sieve of Eratosthenes using a heap and generators

type Generator struct {
    current int
    step int
}

type GenHeap []Generator
func (h GenHeap) Len() int            { return len(h) }
func (h GenHeap) Less(i, j int) bool { return h[i].current < h[j].current }
func (h GenHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *GenHeap) Push(x interface{}) {
    *h = append(*h, x.(Generator))
}

func (h *GenHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

func (h *GenHeap) increase_head() {
    step := (*h)[0].step
    cur := (*h)[0].current
    heap.Pop(h)
    heap.Push(h, Generator{ cur + step, step })
}

func (h *GenHeap) peek() int {
    return (*h)[0].current
}

func main() {
    total := 5 // 2 and 3 included

    generators := &GenHeap{ Generator{4,2}, Generator{9,3} }
    heap.Init(generators)

    i := 4
    for i < 2000000 {
        if i % 2 == 0 || i % 3 == 0 {
            i++
        }

        for {
            if generators.peek() < i {
                generators.increase_head()
            } else {
                break
            }
        }

        if generators.peek() == i {
            // i is composite. Increment possible duplicate generators.
            for {
                if generators.peek() == i {
                    generators.increase_head()
                } else {
                    break
                }
            }
        } else {
            // i is prime.
            total += i
            heap.Push(generators, Generator{ i * i, i})
        }
        i = generators.peek()
    }
    fmt.Println(total)
}
