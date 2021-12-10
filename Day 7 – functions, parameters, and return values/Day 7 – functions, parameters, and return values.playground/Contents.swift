import Cocoa

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
showWelcome()

let roll = Int.random(in: 1...20)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

func compareStrings(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
 compareStrings(string1: "abc", string2: "cba")

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

func pythagoras1(a: Double, b: Double) -> Double {
    sqrt(pow(a, 2) + pow(b, 2))
}

let c = pythagoras1(a: 3, b: 4)
print(c)

func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func helloWorld() {
    return
}

helloWorld()

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")

func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
let (firstName, lastName) = getUser3()
print("Name: \(firstName) \(lastName)")

let firstName1 = user3.firstName
let lastName1 = user3.lastName
print("Name: \(firstName1) \(lastName1)")
print("Name: \(user3.firstName) \(user3.lastName)")

func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

func getUser5() -> (String, String) {
    ("Taylor", "Swift")
}

let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")

let (firstName2, _) = getUser3()
print("Name: \(firstName2)")
