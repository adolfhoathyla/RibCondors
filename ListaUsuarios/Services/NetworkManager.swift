//
//  NetworkManager.swift
//  ListaUsuarios
//
//  Created by Allef Sousa Santos on 03/04/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct NetworkManager: Networkable {
    var provider: MoyaProvider<AuthorsApi> = MoyaProvider<AuthorsApi>()
    
    func getAllAuthors(disposeBag: DisposeBag, completionHandler: @escaping (([Author]?, Bool, Error?) -> ())) {
        provider.rx.request(.getAllAuthors()).map([Author].self).subscribe { (event) in
            switch event {
            case .success(let authors):
                completionHandler(authors, true, nil)
            case .error(let error):
                completionHandler(nil, false, error)
            }
        }.disposed(by: disposeBag)
    }
    
    
}
