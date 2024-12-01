//
//  NetworkConstant.swift
//  Movietrending
//
//  Created by Gülçiya İltaş on 9.11.2024.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
        get {
            return "e738a1f5bcfcdf8b89f37e6e96952909"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
