//
//  Author.swift
//  ListaUsuarios
//
//  Created by Allef Sousa Santos on 03/04/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import UIKit

struct Author {
    var title: String?
    var website: String?
    var authors: String?
    var date: String?
    var content: String?
    var imageUrl: String?
}

extension Author: Decodable {
    enum AuthorCodingKeys: String, CodingKey {
        case title
        case website
        case authors
        case date
        case content
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let conteiner = try decoder.container(keyedBy: AuthorCodingKeys.self)
        
        title = try conteiner.decode(String.self, forKey: .title)
        website = try conteiner.decode(String.self, forKey: .website)
        authors = try conteiner.decode(String.self, forKey: .authors)
        date = try conteiner.decode(String.self, forKey: .date)
        content = try conteiner.decode(String.self, forKey: .content)
        imageUrl = try conteiner.decode(String.self, forKey: .imageUrl)
    }
}
