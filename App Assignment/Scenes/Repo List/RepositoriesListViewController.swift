//
//  RepositoriesListViewController.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

class RepositoriesListViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Injections
    var presenter: RepositoriesListPresenterInput!
    var configurator: RepositoriesListConfigurable!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator = RepositoriesListConfigurator()
        configurator.configure(viewController: self)
        configureTableView()
        presenter.viewDidLoad()
        
    }

    func configureTableView(){
        tableView.register(UINib.init(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "LabelCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
}

// MARK: - RepositoriesListPresenterOutput
extension RepositoriesListViewController: RepositoriesListPresenterOutput {
    
    func displayScreen(title: String) {
        self.title = title
    }
}

//MARK: UITableViewDataSource
extension RepositoriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//MARK: UITableViewDelegate
extension RepositoriesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAt(index: indexPath.row)
    }
}
