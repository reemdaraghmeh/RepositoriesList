//
//  Contributor.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

struct Contributor{
    
    var loginID = ""
    var name = ""
    var imageURLString = ""
    
    var imageURL: URL{
        return URL(string: imageURLString)!
    }
}
