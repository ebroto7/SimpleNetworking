//
//  Books.swift
//  SimpleNetworking
//
//  Created by Enric Broto Hernandez on 10/3/21.
//

import Foundation
import Alamofire

struct Book: Decodable {
    let id: Int
//    let title: String
//    let author: String
//    let genre: String
    let title, author: String
    let genre: String?      //podria ser que la nostra base de dades (backEnd) no tingui aquest camp en alguns llibres
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case author = "author"
        case genre = "book_genre"
    }       // si tots els noms dels case id = "id" coincideixen no hauria de fer la enum, en aquest cas, com que genre no coindideix, haig d'especificarlos tots
    
}
struct BookList: Decodable {
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case books
    }
}

