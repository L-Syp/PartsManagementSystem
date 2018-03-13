//
//  Shoe.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

class Shoe: ManageableProduct {
    // MARK: Properties
    let name: String
    let id: String
    var netPrice: Double
    var quantity: Int
    var size: Int
    
    // MARK: Initializers
    init(name: String, netPrice: Double, size: Int) {
        self.name = name
        self.netPrice = netPrice
        self.size = size
        self.quantity = 0
        self.id = Shoe.generateID()
    }
    
    init(name: String, netPrice: Double, id: String, size: Int) {
        self.name = name
        self.netPrice = netPrice
        self.size = size
        self.quantity = 0
        self.id =  id
    }
}
