import Cocoa

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
let theGameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"
let quote = "Then he tapped a sign saying \"Believe\" and walked away"

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let no = 11
let missionMessage = "Apollo " + String(no) + " landed on the moon"
let missionMessage1 = "Apollo \(no) landed on the moon"
print(missionMessage1)
print("5 x 5 is \(5 * 5)")

let celcius = 25.0
let fahrenheit = celcius * 9 / 5 + 32
print("\(celcius)°C is equal to \(fahrenheit)°F")
// Option+Shift+8 for degrees symbol
