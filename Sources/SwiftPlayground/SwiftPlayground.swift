// The Swift Programming Language
// https://docs.swift.org/swift-book
    let list = [3, 7, 8, 18]
@main

struct SwiftPlayground {
    static func main() {
        let sum = list.reduce(0){$0 + $1}
        print(sum)
        let odd = list.filter{$0%2 != 0}
        print(odd)
        //let high = list.reduce(0){$1 > $0}
    }
}