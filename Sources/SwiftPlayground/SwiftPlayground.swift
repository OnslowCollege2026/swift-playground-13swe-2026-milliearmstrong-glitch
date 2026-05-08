// The Swift Programming Language
// https://docs.swift.org/swift-book
//this is the welcome mesage
import Foundation
//these are all the options the user has to pick from
let options = "A.Borow \nB.Return\nC.regerster as a user \nD.Veiw our catalog \nE.Serch for a spesific user \nF.serch for a specific book \nG.Add an Item \nH.Remove an item \nI.Edit an item \nJ.Edit borrower records"
struct Books: Equatable{
    let id: Int
    var bookTittle: String
    var bookAuther: String
    var copys: Int
    var copysAvalable: Int
    func description(){
        print("\(bookTittle) by \(bookAuther) has \(copysAvalable) out \(copys) copys avalable")
    }
}
struct Borower: Equatable{
    let id: Int
    var name: String
    var bookId: Int

    func thankYou()->String{
        let messages = ["Thank you \(name) for visiting I told you so libray, where every book tried to warn you.", "We hope to see you again \(name), but until then, rember, we told you so", "Until we see you agian \(name), rember, we tried to warn you", "Thanks for coming \(name), we hope to see you again, until then, rember, we told you so", "We hope you enjoyed being wanred \(name)", "\(name), we tried to warn you, the rest is up to you","\(name), do something about the world now, becuse we tried to warn you", "do just sit there \(name), we tried to warn you", "dont forget, we told you so \(name)", "\(name), we told you so"]
        return(messages[Int.random(in: 1..<(messages.count-1))])
    }
}
@main
struct SwiftPlayground {
    static func main() {

        func isNull (ask:String) -> String{
            while true{
                print(ask)
                let input = readLine()!
                if input != ""{
                    return input
                }
            }


        }
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let wellcome:String = "wellcome to the 'Told You So Libry', where every book tried to warn you, what are you looking to do today?"
        func catalog(){
            var loop = 0
            var listing = ["Place holder"]
            for book in bookList{
                loop += 1
                var plural = "copys"
                if book.copysAvalable == 1{
                    plural = "copy"
                }
                listing.append("\(loop).\(book.bookTittle) by \(book.bookAuther), \(book.copysAvalable) \(plural) avalable")
            }
            listing.remove(at: 0)
            for list in listing{
                print(list)
            }
            
            }
        func bookSelection() -> Int{
            catalog()
            var askAgain = true
        while askAgain{
        print("please enter the corosponding number")
        let test = readLine()!.lowercased()
        var vailedChoice = true
        if test == ""{
            vailedChoice = false
        }
        for chr in (alphabet){
            if test.contains(chr){
                vailedChoice = false
            }
        }
        if vailedChoice{
            let choice = Int(test)!
            if choice <= bookList.count && choice >= 1{
                if (bookList[choice-1]).copysAvalable == 0{
                    print("sorry that book is already on loan to another person")
                }
                else{
                askAgain = false
                return ()
                }
        }
        }}
        }
        //this is my starting colection of books for the "We told you so libray", where every book warns you about what you already let happen
        var bookList = [Books(id: 1, bookTittle: "1984", bookAuther: "George Orwell", copys: 3, copysAvalable: 3), Books(id: 2, bookTittle: "the hunger games", bookAuther: "Suzanne Collins", copys: 5, copysAvalable: 4), Books(id: 3, bookTittle: "fahrenheit 451", bookAuther: "Ray Bradbury", copys: 1, copysAvalable: 1), Books(id: 4, bookTittle: "late capitalism", bookAuther: "Ernest Mandel", copys: 2, copysAvalable: 0), Books(id: 5, bookTittle: "the handmaid's tale", bookAuther: "Margaret Atwood",  copys: 2, copysAvalable: 2), Books(id: 6, bookTittle: "I have no mouth and I must scream", bookAuther: "Harlan Ellison", copys: 1, copysAvalable: 1)]
        //this is a list of people who are already regrested with the libray
        
        var users = [Borower(id: 1, name: "Dave", bookId: 2),  Borower(id: 2, name: "Leb", bookId: 4), Borower(id: 3, name: "Rose", bookId: 4), Borower(id: 4, name: "Scout", bookId: 0) ]
        //var numList:[String]

    func nameCheack(anyName: Bool) -> [Borower]{
        var nameInvaled = true
        if anyName{
            print("please enter a users name")
        }
        else{
            print("please enter your name")
        }
        while nameInvaled == true{
        let userName = readLine()!.lowercased()
        let M_Ws = users.filter { seen in return (seen.name).lowercased() == userName}
        if M_Ws != []{
            nameInvaled = false
            return M_Ws
        }    else{
            print("sorry we could not find you in our system, please enter your name again")
        }
        
    }
    }
    func updateUserBooks(M_Ws:[Borower], bookId: Int){
        var copysChange:Int
        switch bookId{
            case 0: copysChange = 1
            default: copysChange = -1
        }
        users[]
        
        users = users.filter { user in return (user.name) != (M_Ws[0].name)} 
        users.append(Borower(id: M_Ws[0].id, name: M_Ws[0].name, bookId: bookId))
        var userBook = bookList.filter { book in return (book.id) == (bookId)} 
        let userCurent = bookList.filter { book in return (book.id) == (M_Ws[0].bookId)} 
        userBook.append(bookList[0])
        bookList = bookList.filter { book in return (book.id) != (M_Ws[0].bookId)} 
        bookList = bookList.filter { book in return (book.id) != (userBook[0].id)} 
        bookList.append(Books(id: userCurent[0].id, bookTittle: userCurent[0].bookTittle, bookAuther: userCurent[0].bookAuther, copys: userCurent[0].copys, copysAvalable: (userCurent[0].copysAvalable) - copysChange))
        bookList.append(Books(id: userBook[0].id, bookTittle: userBook[0].bookTittle, bookAuther: userBook[0].bookAuther, copys: userBook[0].copys, copysAvalable: (userBook[0].copysAvalable) + copysChange))
    }
    print(wellcome)
    func vailedCheack(options:[String], ask: String)-> String{
        var invailedResponce = true
        while invailedResponce{
        print(ask)
        let input = readLine()!.lowercased()
        if (options.filter{$0 == input} != []) && (options.filter {$0 == input} != [""]){
        invailedResponce = false
        return input
        }
        }
    }
    func bookLoned(M_Ws:[Borower]) -> [Books]{
    (bookList.filter { seen in return (seen.id) == M_Ws[0].bookId})
    }
    let letterOptions = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    let line = vailedCheack(options:letterOptions, ask: options).lowercased()
    
    if line == "a"{
        let M_Ws: [Borower] = nameCheack(anyName: false)
        let bookId = bookSelection()
        if M_Ws[0].bookId != 0{
            let usersBook = bookLoned(M_Ws: M_Ws)[0].bookTittle
            print("\(M_Ws[0].name) you already have \(usersBook) on loan.")
            print("would you like to either\na.Keep reading \(usersBook) and not ishue a new book\nB.return\(usersBook) and ishue a new book")
            switch vailedCheack(options:["a","b"], ask:"please enter a or b") {
                case "a": 
                    print(M_Ws[0].thankYou())
                    exit(0)
                default:
                    print("done!")
                    updateUserBooks(M_Ws: M_Ws, bookId: bookId)
                }
            }
            else{
                updateUserBooks(M_Ws: M_Ws, bookId: bookId)
            }
        }
    else if line == "b"{
        let M_Ws: [Borower] = nameCheack(anyName: false)
        switch M_Ws[0].bookId{
                case 0:
                print("you have no books to return")
                default:
                let bookEntry = bookLoned(M_Ws: M_Ws)
                print("Your copy of \(bookEntry[0].bookTittle) has been returned")
                updateUserBooks(M_Ws: M_Ws, bookId: 0)
                print(bookList)
                print(users)}
    }
    else if line == "c"{
        print("please enter your name")
        let newUserName = readLine()!.lowercased()
        let allUserId = users.map{$0.id}
        let newUserId = (allUserId.reduce(allUserId[0]) {result, number in
        return max(result, number)})+1
        users.append(Borower(id: newUserId, name: newUserName, bookId: 0))
}
    else if line == "d"{
        print("this is the I told you so librays catalog of perseinate books")
        catalog()
    }
    else if line == "e"{
        let M_Ws: [Borower] = nameCheack(anyName: true)
        if M_Ws[0].bookId == 0{
            print("\(M_Ws[0].name) has no books on loan")
        }
        else{
            let usersBook = bookLoned(M_Ws: M_Ws)[0].bookTittle
            print("\(M_Ws[0].name) has \(usersBook) on loan")
        }


    }
    else if line == "f"{
        
        var bookInvaild = true
        while bookInvaild{
            print("please serch for a book in our system")
        let bookSearch = readLine()!.lowercased()
        let cheackBookSearch = bookList.filter { book in return (book.bookTittle).lowercased() == bookSearch}
        if cheackBookSearch != []{
            bookInvaild = false
            cheackBookSearch[0].description()
            let numberLoaned = (cheackBookSearch[0].copys) - (cheackBookSearch[0].copysAvalable)
            if numberLoaned != 0{
                
                switch numberLoaned{
                    case 1:print("\(cheackBookSearch[0].bookTittle) is on loan to 1 person:")
                    default:                print("\(cheackBookSearch[0].bookTittle) is on loan to \(numberLoaned) people:")
                }

                let peopleLoaned = users.filter{$0.bookId == cheackBookSearch[0].id}
                for person in peopleLoaned{
                    print(person.name)
                }
            }
        }
        }
        
    }
    
    else if line == "g"{
        print("what would you like to add to the collection?")
        let addBookTittle = isNull (ask:"Please enter the Tittle, be awear that this is case sensative")
        let addBookAuthor = isNull (ask:"Please enter the Author, be awear that this is case sensative")
        var invailedCopyCount = true
        var addBookCount: Int = 0
        while invailedCopyCount{
        let addBookCountString = isNull (ask:"Please enter the amont of copys you would like to add, we can only house up to ten of one book")
        for chr in alphabet{
            if addBookCountString.contains(chr){
            }
            else if Int(addBookCountString)! > 0{
                addBookCount = Int(addBookCountString)!
                invailedCopyCount = false
                }
            }}
        let preExisting = bookList.filter{$0.bookTittle == addBookTittle && $0.bookAuther == addBookAuthor}
        if preExisting != []{
            print("\(addBookTittle) by \(addBookAuthor) is already in our catalog")
            let colectiveBookCount = preExisting[0].copys + addBookCount
            if colectiveBookCount >= 9{
                print("we already have \(preExisting[0].copys) copys of \(preExisting[0].bookTittle) in our collection, so we can only add \(10 - preExisting[0].copys) more copys")
                print(bookList)
            }
            else if colectiveBookCount == 10{
                print("we already have 10 copys of \(preExisting[0].bookTittle) in our collection, so we can not house any more")
                bookList.append(Books(id: newBookId, bookTittle: addBookTittle, bookAuther: addBookAuthor, copys: addBookCount, copysAvalable: addBookCount))
                print(bookList)
            }
        }
        else{
            let allBookId = bookList.map{$0.id}
            let newBookId = (allBookId.reduce(allBookId[0]) {result, number in
            return max(result, number)})+1
            bookList.append(Books(id: newBookId, bookTittle: addBookTittle, bookAuther: addBookAuthor, copys: addBookCount, copysAvalable: addBookCount))
            print("\(addBookTittle) has been added, thank you!")
            print(bookList)
        }
                
        }

    }
    }