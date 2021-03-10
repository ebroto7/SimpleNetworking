//
//  Endpoints.swift
//  
//
//  Created by Enric Broto Hernandez on 10/3/21.
//

import Foundation

enum Endpoints: String {

    case allUsers = "https://private-9f06db-multitest.apiary-mock.com/users/all"
    case usersByCity = "https://private-9f06db-multitest.apiary-mock.com/users"
    case books = "https://private-9f06db-multitest.apiary-mock.com/books/bestSellers"

    var url: String {

        return self.rawValue

    }

}
