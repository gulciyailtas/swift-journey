//
//  main.swift
//  Loops
//
//  Created by Gülçiya İltaş on 20.06.2024.
//

import Foundation

print("Hello, World!")

// While Döngüsü


var myNumber = 1
myNumber = myNumber + 1
myNumber = myNumber + 1
print(myNumber)

var myOrder = 0
while myOrder <= 10 {
    print(myOrder)
    myOrder = myOrder + 1

}
   
var myAge = 15
while myAge < 20 {
    print(myAge)
    myAge = myAge + 2
}

// For Loop


var myFriutArray = [ "Banana","Apple","Orange"]
for friut in myFriutArray {
    print(friut)
}

var myNumbers = [10,20,30,40,50,60]
for num in myNumbers {
    print(num/5)
}
var myRowNumber = [2,3,4,5,6,7]
for number in myRowNumber {
    print(number*3)
}

var myFavotiteColours = ["Black","White","Blue"]
for colour in myFavotiteColours {
    print(colour)
}

var myFavoriteMovies = ["Harry Potter","The Walking Dead","Friends"]
for movies in myFavoriteMovies {
    print(movies)
}

var myFavoriteFlowers = ["Daisy","Lotus","Rose"]
for flower in myFavoriteFlowers {
    print(flower)
}

var myFavoriteAnimals = ["Pigeon","Lion",]
for animal in myFavoriteAnimals {
    print(animal)
}
