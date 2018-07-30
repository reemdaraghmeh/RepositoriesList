//
//  RepositoryDetailsViewController.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Injections
    var presenter: RepositoryDetailsPresenterInput!
    var configurator: RepositoryDetailsConfigurable!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        configureTableView()
        presenter.viewDidLoad()
        
    }

    func configureTableView(){
        tableView.register(UINib.init(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "LabelCell")
        tableView.register(UINib.init(nibName: "ContributorCell", bundle: nil), forCellReuseIdentifier: "ContributorCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
}

// MARK: - RepositoryDetailsPresenterOutput
extension RepositoryDetailsViewController: RepositoryDetailsPresenterOutput {
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension RepositoryDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContributorCell", for: indexPath) as! ContributorCell
            presenter.configure(contributorCell: cell, index: indexPath.row)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
            presenter.configure(cell: cell, for: indexPath.section)
            return cell
        }
        
    }
}

extension RepositoryDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3{
            return 100
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.titleForHeaderAt(section: section)
    }
}
