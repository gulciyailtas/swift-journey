//
//  main.swift
//  Functions
//
//  Created by Gülçiya İltaş on 5.07.2024.
//

import Foundation

print("Hello, World!")


// Fonksiyonlar

func myFunction() {
    print("my Function")
}
print("print")
myFunction()

// İnput & Output & Reuturn

func sumFunction(x : Int , y : Int) {
   print(x + y)
}
sumFunction(x: 10, y: 20)

func sumFunction(a : Int , b : Int ) -> Int {
    return a + b
}

let myFunctionVariable = sumFunction(a: 10, b: 5)
print(myFunctionVariable)

func logicFunction(a : Int , b : Int) -> Bool {
    if a > b {
        return true
    }else {
        return false
    }
}

let myFunctionVariables = sumFunction(a: 30, b: 25)
print(myFunctionVariables)

func logicFunction(a : Int , b : Int) -> String {
    if a > b {
        return "Greater"
    }else {
        return "Less"
    }
}

