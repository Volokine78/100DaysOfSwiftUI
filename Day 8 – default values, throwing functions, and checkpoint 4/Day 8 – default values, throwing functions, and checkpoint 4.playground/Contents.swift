import Cocoa

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 6)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"
let password = "fs445s6f4s55"
let password2 = "25"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

do {
    let result = try checkPassword(password2)
    print("Password rating: \(result)")
} catch {
    print("There was an error \(error.localizedDescription)")
}

let result2 = try! checkPassword(password)
print(result2)

// Checkpoint 4
enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
    
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }

    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw SquareRootError.noRoot
}

let number = 49

do {
    let result = try squareRoot(of: number)
    print("Square root of \(number) is \(result)")
} catch SquareRootError.outOfBounds {
    print("Please use range of 1...10_000")
} catch SquareRootError.noRoot {
    print("This number has no square root")
}

func sqrt123(number: Int) -> Int {
    Int(pow(Double(number), 0.5))
}

print(sqrt123(number: 49))

