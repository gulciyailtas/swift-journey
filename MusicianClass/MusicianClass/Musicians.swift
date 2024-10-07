//
//  Musicians.swift
//  MusicianClass
//
//  Created by Gülçiya İltaş on 29.09.2024.
//

import Foundation

enum MusicianType{
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassit
    case Violenist
}

class Musicians {
    
    //Property
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    //İnitializer(Constructor)
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing() {
        print("nothing else matters")
    }
    
}
