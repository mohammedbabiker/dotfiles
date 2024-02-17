package main

import "fmt"

func main() {
    var array = []int{1, 2, 3, 4, 5, 6}
    for _, num := range array {
        if isEven(num) {
            fmt.Printf("number %d is even\n", num)
        } else {
            fmt.Printf("number %d is odd\n", num)
        }
    }
}

func isEven(num int) bool {
    res := num % 2
    if res == 1 {
        return true
    }
    return false
}
