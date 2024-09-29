//
//  main.swift
//  IfControl
//
//  Created by Gülçiya İltaş on 4.07.2024.
//

import Foundation

print("Hello, World!")


// İf Kontrolleri


var myAge = 32
if myAge < 30 {
    print("30 -")
    
} else if myAge > 30 && myAge < 40 {
    print("30s")
}

var myUserAge = 20
if myUserAge > 25 {
    print("20s")
}else if myUserAge > 35 && myUserAge < 45 {
    print("20 %")
}else {
    print("20 *")
}
    

var myNumber = 45
if myNumber < 40 {
    print("40 -")
}else if myNumber > 40 && myNumber < 50 {
    print("40 +")
}else {
    print("50 +")
}


var myFavoriteNumber = 73
if myFavoriteNumber < 65 {
    print("60 -")
}else if myFavoriteNumber > 70 && myFavoriteNumber < 75 {
    print("60s")
}else {
    print("60 -")
}


var myOrderNumber = 125
if myOrderNumber > 130 {
    print("145 +")
}else if myOrderNumber > 135 && myOrderNumber < 145 {
    print("145s")
}else {
    print("140 -")
}


var myRowNumber = 160
if myRowNumber < 165 {
    print("180 +")
}else if myRowNumber > 170 && myRowNumber < 175 {
    print("180s")
}else {
    print("180 -")
}


var myString = "James"
if myString == "james" {
    print("True")
}else {
    print("False")
}


var myNameIs = "Liam"
if myNameIs == "Alice" {
    print("Mila")
}else {
    print("Gulciya")
}


var mySurname = "Misty"
if mySurname == "May"{
    print("Alles")
}else {
    print("Iltas")
}


var myNewString = "Julia"
if myNewString == "Cerry"{
    print("Jessica")
}else {
    print("Maria")
}
