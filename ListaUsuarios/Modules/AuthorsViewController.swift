//
//  AuthorsViewController.swift
//  ListaUsuarios
//
//  Created by Allef Sousa Santos on 03/04/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import UIKit
import RxSwift

class AuthorsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: AuthorsViewModelProtocol = AuthorsViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        
        viewModel.getAllAuthors(disposeBag: disposeBag)
        
        viewModel.authors.subscribe { (event) in
            self.tableView.reloadData()
            print(event)
        }.disposed(by: disposeBag)
    }
    
    func configTableView() {
        tableView.tableFooterView = UIView()
    }

}

extension AuthorsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AUTHOR_CELL", for: indexPath)
        cell.textLabel?.text = viewModel.getAuthor(indexPath: indexPath).authors
        cell.detailTextLabel?.text = viewModel.getAuthor(indexPath: indexPath).date
        return cell
    }
    
    
}
