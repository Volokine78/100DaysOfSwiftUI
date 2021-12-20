import Cocoa

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
number = 5
if let number = number {
    print(square(number: number))
}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book1 {
    let title: String
    let author1: String?
}

var book1: Book1? = nil
let author1 = book1?.author1?.first?.uppercased()

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user1 = (try? getUser(id: 23)) ?? "Anonymous"
print(user1)

// MARK: - Checkpoint 9
func opt(_ array: [Int]?) -> Int {array?.randomElement() ?? Int.random(in: 1...100) }
opt([1, 2, 3, 4])
opt(nil)
opt([])
