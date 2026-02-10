// The Swift Programming Language
// https://docs.swift.org/swift-book

@main

struct SwiftPlayground {
    static func main() {
        let words = ["apple", "cat", "banana", "dog", "grape", "kiwi"]
        
        let myWords = words.filter { word in
        return word.count > 4 }
        print(myWords)
        let numbers = [7, 14, 21, 28, 35]
        let total = numbers.reduce(0) { Result, number in return Result + number}
        print (total)

        let foods = ["apple", "banana", "grape", "strawberry", "kiwi"]
        let long = foods.reduce(foods[0]) { result, food in
            return max(result, food)
        }
        print(long)

        let sq = numbers.map { number in 
        return number * number 
        }
        print (sq)
    }
}