//
//  main.swift
//  Arrays
//
//  Created by Gülçiya İltaş on 20.06.2024.
//

import Foundation

print("Hello, World!")

// Array

var myFavoriteMovies = [ "Harry Poter","Kill Bill"]
print(myFavoriteMovies[0])
print(myFavoriteMovies[1])

var myStringArray = ["Test","Test2","Test3","Test4"]
print(myStringArray[0])
print(myStringArray[1])
print(myStringArray[2])
print(myStringArray[3])
print(myStringArray.count)
print(myStringArray.count - 1)
print(myStringArray.count - 2)
print(myStringArray.last!)
print(myStringArray[0].uppercased())
print(myStringArray[2].lowercased())
print(myStringArray.sorted())

var myNumberArray = [1,2,3,4,5,6,7]
print(myNumberArray.sorted())
print(myNumberArray[0])
print(myNumberArray[3])
print(myNumberArray[5])
print(myNumberArray.count - 3)
print(myNumberArray.count - 4)
print(myNumberArray.count - 6)
print(myNumberArray.append(8))

var myFavoteFruit = ["Apple","Strawberry","Cherry"]
print(myFavoteFruit[0])
print(myFavoteFruit[1])
print(myFavoteFruit[2])
print(myFavoteFruit.append("Melon"))

// Set ( Sırasız Koleksiyon )
// Unordered Collection, Unique Elemets


var mySet : Set = [1,2,3,4,5,1,2]
print(mySet)

var myStringSet : Set = ["a","b","c","a"]
print(myStringSet)

var myInternetArray = [1,2,3,1,2,5,6,2,1]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]
var mySet3 = mySet1.union(mySet2)
print(mySet3)

var mySet4 : Set = [0,1,2,3,4,5,6]
print(mySet4)

// Dictionary
// Key - value pairing

var myFavorteDirectors = ["Pulp Fiction":"Tarantino","Lock,Stock":"Guy Ritche","The Dark Knight": "Christopher Nolan"]
print(myFavorteDirectors["Pulp Fiction"]!)
print(myFavorteDirectors["Lock,Stock"]!)

myFavorteDirectors["Pulp Fiction"] = "Quention Tarantino"
print(myFavorteDirectors)

myFavorteDirectors["Seven Samurai"] = "Akira Kurisowa"
print(myFavorteDirectors)

var myDictonary = ["Run":100,"Swim":200,"Basketball":300]
print(myDictonary["Run"]!)
print(myDictonary["Swim"]!)
print(myDictonary["Basketball"]!)

 












