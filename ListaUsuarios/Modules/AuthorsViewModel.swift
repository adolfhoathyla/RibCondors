//
//  AuthorsViewModel.swift
//  ListaUsuarios
//
//  Created by Allef Sousa Santos on 03/04/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol AuthorsViewModelProtocol {
    var authors: BehaviorRelay<[Author]> { get set }
    var provider: Networkable { get set }
    func getAllAuthors(disposeBag: DisposeBag)
    func numberOfRows() -> Int
    func getAuthor(indexPath: IndexPath) -> Author
}


class AuthorsViewModel: NSObject, AuthorsViewModelProtocol {
    var authors: BehaviorRelay<[Author]> = BehaviorRelay(value: [])
    
    var provider: Networkable = NetworkManager()
    
    func getAllAuthors(disposeBag: DisposeBag) {
        provider.getAllAuthors(disposeBag: disposeBag) { [weak self] (authors, success, error) in
            if let authors = authors, success, error == nil {
                self?.authors.accept(authors)
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.authors.value.count
    }
    
    func getAuthor(indexPath: IndexPath) -> Author {
        return self.authors.value[indexPath.row]
    }
}
