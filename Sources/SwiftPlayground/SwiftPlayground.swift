// The Swift Programming Language
// https://docs.swift.org/swift-book
//this is the welcome mesage
import Foundation
///all the things the user can do with the records
let options = "A.Borow \nB.Return\nC.regerster as a user \nD.Veiw our catalog \nE.Serch for a spesific user \nF.serch for a specific book \nG.Add an Item \nH.Remove an item \nI.Edit an item \nJ.Edit a users name\nK.About us\nL.exit the libray"

/// a satirical and ubserdast take on the about us page on a website
let aboutUs = "The we told you so libray is home to a wide ranging and diverse collection of presaint books that will make you go 'oh f**k, we should have listened to them'. After being founded in 2013, through a series of tax shelters tax shulters, state sponsered terosim, embezlement, and national hoaxes we have become the worlds formost depresing libray, narrowly beating out the still smoking ashes of the library of Alexandria. We are built on one founding idea, it's better to stop it but it's quite nice to be right about it either way. So always rember, we told you so. \n we would like to breifly adress the puppy kicking algations\n\nwe wont stop we never plan to stop and you can make us stop. you might be wondering 'what does this have to do with cautionary tale/post-mortem books'\nnothing, were hobiests more then anything else, we're layerd people, we can have a life outside of Margaret Atwood, and sometimes that life is kicking a schnauzer in the snoze\n\n\nFAQs\nWhy can you only have 10 copies of each book?\n because if more than 10 people are reading 1984 at the same time the arguments they would have about why the book agrees with their specific ideology the most would create enough wind power to put most in power companys out of business\nWhy should I read late capatilism by Ernest Mandel\n I don't know but if you figure it out please do tell me\nDid you kill the mayors wife\nAre you a snitch?"
///keeps track of how many books there are, how mnay there are ment to be, and some breif infomation on the book
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
///contains the borower name, there unique id, and the id of the book they have out . if the user has no book out, the bookId is set to zero
struct Borower: Equatable{
    let id: Int
    var name: String
    var bookId: Int

    
}
@main
struct SwiftPlayground {
    static func main() {
        ///prints a random goodbye message for the user
        func thankYou() -> String{
        ///this is a collection of thank you messages presented when the user decides they are finished
        let messages = ["Thank you  for visiting I told you so libray, where every book tried to warn you.", "We hope to see you again, but until then, rember, we told you so", "Until we see you agian, rember, we tried to warn you", "Thanks for coming, we hope to see you again, until then, rember, we told you so", "We hope you enjoyed being wanred", "We tried to warn you, the rest is up to you","do something about the world now, becuse we tried to warn you", "dont just sit there, we tried to warn you", "dont forget, we told you so", "We told you so"]
        //they are randomly gived using this code
        return(messages[Int.random(in: 1..<(messages.count-1))])
    }
        
        /// this function is used by G, add item. it apends the users book to the alread existing book list
        /// - Parameters:
        ///   - newBookId: the id of the book that is being added by the user. this id is set using a reduce closer
        ///   - addBookTittle: the book tittle provided by the user
        ///   - addBookAuthor: the book auther provided by the user
        ///   - addBookCount: the amount of copys there are, with a max of ten per book
        func addNewBook(newBookId: Int, addBookTittle: String, addBookAuthor:String, addBookCount: Int, newBookCopys:Int){
            bookList.append(Books(id: newBookId, bookTittle: addBookTittle, bookAuther: addBookAuthor, copys: addBookCount, copysAvalable: newBookCopys))
            print("\(addBookTittle) has been added, thank you!")

        }
        /// this function will continue to repete a question until the user enters an input that is not a null, it is used exsclusivly for strings
        /// - Parameter ask:the question for the user 
        /// - Returns: the users imput that is not a null
        func isNull (ask:String) -> String{
            while true{
                print(ask)
                let input = readLine()!
                if input != ""{
                    return input
                }
            }
        }
        ///keeps track of weather the user wants to continue interacting with the interface, or is finished, when the user is finished, this would be set to false and the while loop would end
        var stillHere = true
        ///wellcome message
        let wellcome: String = "wellcome to the 'Told You So Libry', where every book tried to warn you, what are you looking to do today?"
        ///prints the entire catalog of books
        func catalog(){
            var loop = 0
            ///a list of all the books, there auther, how many are avalable, and most importently, a number to be called on by a user to indentafy it
            var listing = ["Place holder"]
            for book in bookList{
                loop += 1
                var plural = "copys"
                if book.copysAvalable == 1{
                    plural = "copy"
                }
                listing.append("\(loop).\(book.bookTittle) by \(book.bookAuther), \(book.copysAvalable) \(plural) avalable")
            }
            //this is done to remove "place holder"
            listing.remove(at: 0)
            for list in listing{
                print(list)
            }
            
            }
        ///uses the catalog function to show the user options then gets there input on whitch book to select
        func bookSelection() -> Books{
            catalog()
            var askAgain = true
            while askAgain{
                print("please enter the corosponding number")
                let test = readLine()!.lowercased()
                var invailedChoice = true
                if test == ""{
                    invailedChoice = true
                }
                //this to see if the input was a number, or a charecter, becuse if you convert a charecter to a int, the program will crash
                for n in (1...bookList.count){
                    if test == String(n){
                        invailedChoice = false
                    }
                }
                if invailedChoice == false{
                    let choice = Int(test)!
                    if choice <= bookList.count && choice >= 1{
                        if (bookList[choice-1]).copysAvalable == 0{
                            print("sorry that book is already on loan to another person")
                        }
                        else{
                            askAgain = false
                            return ((bookList[choice-1]))
                        }
                }
                }}
        }
        ///starting colection of books for the "We told you so libray", it starts with 6 books
        var bookList = [Books(id: 1, bookTittle: "1984", bookAuther: "George Orwell", copys: 3, copysAvalable: 3), Books(id: 2, bookTittle: "the hunger games", bookAuther: "Suzanne Collins", copys: 5, copysAvalable: 4), Books(id: 3, bookTittle: "fahrenheit 451", bookAuther: "Ray Bradbury", copys: 1, copysAvalable: 1), Books(id: 4, bookTittle: "late capitalism", bookAuther: "Ernest Mandel", copys: 2, copysAvalable: 0), Books(id: 5, bookTittle: "the handmaid's tale", bookAuther: "Margaret Atwood",  copys: 2, copysAvalable: 2), Books(id: 6, bookTittle: "I have no mouth and I must scream", bookAuther: "Harlan Ellison", copys: 1, copysAvalable: 1)]
        ///the regerstered users at the libray
        var users = [Borower(id: 1, name: "Dave", bookId: 2),  Borower(id: 2, name: "Leb", bookId: 4), Borower(id: 3, name: "Rose", bookId: 4), Borower(id: 4, name: "Scout", bookId: 0) ]
    /// finds a spesific user, if the users imput is not in the system, then it will continue to ask until the user provides a input that is in the system
    /// - Parameter anyName: some functionalty is trying to get the user to find themself, other is just to find any user, anyName changes the question possed to user deepending if the function needs just any name, or spesifcly the users name
    /// - Returns: the entire user instance in the form of an aray
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
        let userBorowing = users.filter { book in return (book.name).lowercased() == userName}
        if userBorowing != []{
            nameInvaled = false
            return userBorowing
        }    else{
            print("sorry we could not find you in our system, please enter your name again")
        }
        
    }
    }
    /// to avoid serching for spesific indexs of the instances of the books and users that need to be updated, this function goes throgh and dealtes the organle instances and replaces them with updated versions of them
    /// - Parameters:
    ///   - userBorowing: the user who is borowing the book
    ///   - bookId: the book id of the book the user would like to borrow user would like to borow
    func updateUserBooks(userBorowing:[Borower], bookId: Int){
        var copysChange:Int
        switch bookId{
            case 0: copysChange = 1
            default: copysChange = -1
        }
        users = users.filter { user in return (user.name) != (userBorowing[0].name)} 
        users.append(Borower(id: userBorowing[0].id, name: userBorowing[0].name, bookId: bookId))
        var userBook = bookList.filter { book in return (book.id) == (bookId)} 
        let userCurent = bookList.filter { book in return (book.id) == (userBorowing[0].bookId)} 
        userBook.append(bookList[0])
        bookList = bookList.filter { book in return (book.id) != (userBorowing[0].bookId)} 
        bookList = bookList.filter { book in return (book.id) != (userBook[0].id)} 
        bookList.append(Books(id: userCurent[0].id, bookTittle: userCurent[0].bookTittle, bookAuther: userCurent[0].bookAuther, copys: userCurent[0].copys, copysAvalable: (userCurent[0].copysAvalable) - copysChange))
        bookList.append(Books(id: userBook[0].id, bookTittle: userBook[0].bookTittle, bookAuther: userBook[0].bookAuther, copys: userBook[0].copys, copysAvalable: (userBook[0].copysAvalable) + copysChange))
        print(bookList)
    }
    print(wellcome)
    /// cheacks the users imput agenst an aray of two or more options and continues to ask for the users imput until it is one of the options
    /// - Parameters:
    ///   - options: the options the user has to pick from
    ///   - ask: the prompting question for the user
    /// - Returns: the final responce, whitch is once of the options
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
    /// finds the book the user has borrowed curently
    /// - Parameter userBorowing: the user who is has the book
    /// - Returns: the book entry
    func bookLoned(userBorowing:[Borower]) -> Books{
    return (bookList.filter { book in return (book.id) == userBorowing[0].bookId})[0]
    }
    let letterOptions = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
    while stillHere{
    sleep(1)
    let line = vailedCheack(options:letterOptions, ask: options).lowercased()
    
    if line == "a"{
        let userBorowing: [Borower] = nameCheack(anyName: false)
        let bookId = bookSelection().id
        if userBorowing[0].bookId != 0{
            let usersBook = bookLoned(userBorowing: userBorowing).bookTittle
            print("\(userBorowing[0].name) you already have \(usersBook) on loan.")
            print("would you like to either\na.Keep reading \(usersBook) and not ishue a new book\nB.return\(usersBook) and ishue a new book")
            switch vailedCheack(options:["a","b"], ask:"please enter a or b") {
                case "a": 
                print("ok")
                default:
                    print("done!")
                    updateUserBooks(userBorowing: userBorowing, bookId: bookId)
                }
            }
            else{
                updateUserBooks(userBorowing: userBorowing, bookId: bookId)
            }
        }
    else if line == "b"{
        let userBorowing: [Borower] = nameCheack(anyName: false)
        switch userBorowing[0].bookId{
                case 0:
                print("you have no books to return")
                default:
                let bookEntry = bookLoned(userBorowing: userBorowing)
                print("Your copy of \(bookEntry.bookTittle) has been returned")
                updateUserBooks(userBorowing: userBorowing, bookId: 0)
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
        let userBorowing: [Borower] = nameCheack(anyName: true)
        if userBorowing[0].bookId == 0{
            print("\(userBorowing[0].name) has no books on loan")
        }
        else{
            let usersBook = bookLoned(userBorowing: userBorowing).bookTittle
            print("\(userBorowing[0].name) has \(usersBook) on loan")
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

                for n in (1...10){
            if !addBookCountString.contains(String(n)){
            }
            else if Int(addBookCountString)! > 0{
                addBookCount = Int(addBookCountString)!
                invailedCopyCount = false
                }
            }}
        let preExisting = bookList.filter{$0.bookTittle == addBookTittle && $0.bookAuther == addBookAuthor}
                    let allBookId = bookList.map{$0.id}
            let newBookId = (allBookId.reduce(allBookId[0]) {result, number in
            return max(result, number)})+1
        if preExisting != []{
            print("\(addBookTittle) by \(addBookAuthor) is already in our catalog")
            let colectiveBookCount = preExisting[0].copys + addBookCount
            if colectiveBookCount >= 9{
                print("we already have \(preExisting[0].copys) copys of \(preExisting[0].bookTittle) in our collection, so we can only add \(10 - preExisting[0].copys) more copys")
                addNewBook(newBookId: newBookId, addBookTittle: addBookTittle, addBookAuthor:addBookAuthor, addBookCount: addBookCount, newBookCopys: preExisting[0].copys)
            }
            else if colectiveBookCount == 10{
                print("we already have 10 copys of \(preExisting[0].bookTittle) in our collection, so we can not house any more")
            }
        }
        else{
            if addBookCount > 10{
                print("sorry but we cant not house more then 10 of one book, so we can only sholve 10 of \(addBookTittle)")
                addNewBook(newBookId: newBookId, addBookTittle: addBookTittle, addBookAuthor:addBookAuthor, addBookCount: addBookCount, newBookCopys: 10)
            }
            else{
            addNewBook(newBookId: newBookId, addBookTittle: addBookTittle, addBookAuthor:addBookAuthor, addBookCount: addBookCount, newBookCopys: addBookCount)}
        }
                
    }
    else if line == "h"{
        print("what book would you like to remove?")
        bookList.remove(at: bookList.firstIndex(of: bookSelection())!)
        print("you are censoring the people by taking their books, they will not stand for it, this is the begining of the end for media litaralcy\n\n\n\n\nit has been removed")
    }
    else if line == "i"{
        print("what item would you like to edit?")
        let editBook = bookSelection()
        //bookList.remove(at: bookList.firstIndex(of: editBook)!)
        if vailedCheack(options:["y","n"], ask: "would you like to edit the tittle(y/n)?") == "y"{
            bookList[(bookList.firstIndex(of: editBook)!)].bookTittle = isNull (ask:"Please enter the new tittle")

        }
        if vailedCheack(options:["y","n"], ask: "would you like to edit the author(y/n)?") == "y"{
            bookList[(bookList.firstIndex(of: editBook)!)].bookAuther = isNull (ask:"Please enter the new author")
        }

    }
    else if line == "j"{
        let nameEdit = nameCheack(anyName: true)
            users[(users.firstIndex(of: nameEdit[0])!)].name = isNull (ask:"Please enter the new user name")
    }
    else if line == "k"{
        print(aboutUs)
    }
    else{
        print(thankYou())
        stillHere = false
        
    }}

    }
    }