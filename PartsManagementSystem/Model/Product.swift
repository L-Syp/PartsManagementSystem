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
    var netPrice: Decimal
    var quantity: Int
    var size: Int
    
    // MARK: Initializers
    init(name: String, netPrice: Decimal, size: Int) {
        self.name = name
        self.netPrice = netPrice
        self.size = size
        self.quantity = 0
        self.id = Shoe.generateID()
    }
    
    init(name: String, netPrice: Decimal, id: String, size: Int) {
        self.name = name
        self.netPrice = netPrice
        self.size = size
        self.quantity = 0
        self.id =  id
    }
}
