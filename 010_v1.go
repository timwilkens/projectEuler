package main
import (
    "fmt"
    "math"
    "runtime"
)
// Messing around learning how to use channels and go routines.

func launch_worker(work_queue <-chan int, answer_queue chan<-int, done chan<-int) {
    // Process work until the work_queue is empty.
    for work := range work_queue {
        if is_prime(work) {
            answer_queue <- work
        }
    }
    // Send our finished signal.
    done <- 1
}

func wait_for_workers(done <-chan int, answer_queue chan int, n int) {
    // Sit waiting one message per worker, then close the answer channel.
    for i := 0; i < n; i++ {
        <- done
    }
    close(answer_queue)
}

func is_prime(n int) bool {
    if n == 2 { return true }

    if math.Mod(float64(n), 2) == 0 { return false }

    for i := 3.0; i <= math.Floor(math.Sqrt(float64(n))); i += 2.0 {
        if math.Mod(float64(n), i) == 0 {
            return false
        }
    }
    return true
}

func add_work(work_queue chan int) {
    // Fill the work queue.
    for i := 2; i < 2000000; i++ {
        work_queue <- i
    }

    // No more work in.
    close(work_queue)
}

func main() {

    cpus := runtime.NumCPU()
    max_work := 2 * cpus
    runtime.GOMAXPROCS(cpus)

    answer_queue := make(chan int, max_work)
    done         := make(chan int, max_work)
    work_queue   := make(chan int, max_work)

    go add_work(work_queue)

    workers_launched := 0;
    for i := 1; i < max_work; i++ {
        workers_launched++;
        go launch_worker(work_queue, answer_queue, done)
    }

    go wait_for_workers(done, answer_queue, workers_launched)

    total := 0
    for elem := range answer_queue {
        total += elem
    }
    fmt.Println(total)
}
