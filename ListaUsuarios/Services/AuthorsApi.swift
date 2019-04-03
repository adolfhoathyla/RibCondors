//
//  AuthorsApi.swift
//  ListaUsuarios
//
//  Created by Allef Sousa Santos on 03/04/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import Foundation
import Moya

enum AuthorsApi {
    case getAllAuthors()
}

extension AuthorsApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://cheesecakelabs.com")!
    }
    
    var path: String {
        return "/challenge"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

