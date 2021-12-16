import Cocoa

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdraw money successfully")
} else {
    print("Failed to get the money")
}

print(account.funds)

struct School {
    static var studentCount = 0
    var teacherCount = studentCount + 5
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)
let totalCount = School()
totalCount.teacherCount

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

Employee.example

// MARK: - Checkpoint 6
struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    mutating func gearUp() {
        if currentGear > 0 && currentGear < 10 {
            currentGear += 1
        }
    }
    
    mutating func gearDown() {
        if currentGear > 1 && currentGear <= 10 {
            currentGear -= 1
        }
    }
}

var ferrari = Car(model: "F50", numberOfSeats: 2, currentGear: 5)
ferrari.gearDown()
print(ferrari.currentGear)
ferrari.gearUp()
print(ferrari.currentGear)

