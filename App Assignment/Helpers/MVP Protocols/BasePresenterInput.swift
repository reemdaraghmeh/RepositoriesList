//
//  BasePresenterInput.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

protocol BasePresenterInput {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func viewDidLayoutSubviews()
}


extension BasePresenterInput {
    func viewWillAppear()    { }
    func viewDidAppear()     { }
    func viewWillDisappear() { }
    func viewDidDisappear()  { }
    func viewDidLayoutSubviews() { }
}
