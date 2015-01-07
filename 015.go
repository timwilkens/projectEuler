package main

import "fmt"

func canGoRight(n int) bool { return !(n % gridSize == 0) }
func canGoDown(n int) bool { return n <= (finalNode - gridSize) }
func isFinal(n int) bool { return n == finalNode }

func pathsFromPosition(n int) int {

    if paths, ok := cachedResults[n]; ok {
        return paths
    }

    if isFinal(n) {
        return 1
    }

    totalPaths := 0

    if canGoDown(n) {
        totalPaths += pathsFromPosition(n + gridSize)
    }
    if canGoRight(n) {
        totalPaths += pathsFromPosition(n + 1)
    }

    cachedResults[n] = totalPaths
    return totalPaths
}

func solve() int {
    return pathsFromPosition(1)
}

var squareSize = 20
// A square of n blocks has n+1 intersections per line.
var gridSize = squareSize + 1
var finalNode = gridSize * gridSize
var cachedResults map[int]int

func main() {
    cachedResults = make(map[int]int)
    fmt.Println(solve())
}
