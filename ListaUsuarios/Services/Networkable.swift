//
//  Networkable.swift
//  ListaUsuarios
//
//  Created by Allef Sousa Santos on 03/04/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol Networkable {
    var provider: MoyaProvider<AuthorsApi> { get }
    func getAllAuthors(disposeBag: DisposeBag,
                       completionHandler: @escaping (([Author]?, Bool, Error?) -> ()))
}
