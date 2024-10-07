//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Gülçiya İltaş on 7.10.2024.
//

import Foundation

class SuperMusician : Musicians {
    
    func sing2() {
        print("enter night")
    }
    override func sing() {
        super.sing()
        print("exit light")
    }
}



