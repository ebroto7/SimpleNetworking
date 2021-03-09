//
//  User.swift
//  SimpleNetworking
//
//  Created by Enric Broto Hernandez on 9/3/21.
//

import Foundation
import Alamofire

struct User: Decodable {
    let name: String
    let city: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case city
    }
}

struct UserList: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}
