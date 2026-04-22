// The Swift Programming Language
// https://docs.swift.org/swift-book
struct Books{
    let id: Int
    var bookTittle: String
    var bookAuther: String
    var copys: Int
    var copysAvalable: Int
}
struct Borower{
    let id: Int
    var name: String
    var bookId: Int
}
@main


struct SwiftPlayground {
    static func main() {
        //this is my starting colection of books for the "We told you so libray", where every warns you about what you already let happen
        var bookList = [Books(id: 1, bookTittle: "1984", bookAuther: "George Orwell", copys: 3, copysAvalable: 3), Books(id: 2, bookTittle: "the hunger games", bookAuther: "Suzanne Collins", copys: 5, copysAvalable: 4), Books(id: 3, bookTittle: "fahrenheit 451", bookAuther: "Ray Bradbury", copys: 1, copysAvalable: 1), Books(id: 4, bookTittle: "late capitalism", bookAuther: "Ernest Mandel", copys: 2, copysAvalable: 0), Books(id: 5, bookTittle: "the handmaid's tale", bookAuther: "Margaret Atwood",  copys: 2, copysAvalable: 2), Books(id: 6, bookTittle: "I have no mouth and I must scream", bookAuther: "Harlan Ellison", copys: 1, copysAvalable: 1)]
        
        //this is a list of people who are already regrested with the libray
        var clinets = [ Borower(id: 1, name: "Dave", bookId: 2),  Borower(id: 2, name: "Leb", bookId: 4), Borower(id: 3, name: "Rose", bookId: 4), Borower(id: 4, name: "Scout", bookId: 0) ]
    print("wellcome to the 'Told You So Libry', where every book tried to warn you, what are you looking to do today?")
    print("A.Borow \n B.Return \n C.regerster as a user \n D.Veiw our catalog \n E.Serch for a spesific user \n F.serch for a specific book \n G.Add an Item \n H. Remove an item \n I.Edit an item \n J.Edit borrower records")
    
    }
}