//
//  MockManageableProduct.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 12/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation
@testable import PartsManagementSystem

struct MockManageableProduct: ManageableProduct {
    // MARK: Properties
    let name: String
    let id: String
    var netPrice: Decimal
    var quantity: Int
    
    // MARK: Initializers
    init(name: String, netPrice: Decimal) {
        self.name = name
        self.netPrice = netPrice
        self.quantity = 0
        self.id = MockManageableProduct.generateID()
    }
    
    init(name: String, netPrice: Decimal, id: String) {
        self.name = name
        self.netPrice = netPrice
        self.quantity = 0
        self.id = id
    }
}

// Type created to test removeAllProducts<T>(ofType type: T.Type) function from ProductManaging protocol
struct MockManageableAnotherProduct: ManageableProduct {
    // MARK: Properties
    let name: String
    let id: String
    var netPrice: Decimal
    var quantity: Int
    var someProperty: Int
    
    // MARK: Initializers
    init(name: String, netPrice: Decimal) {
        self.name = name
        self.netPrice = netPrice
        self.quantity = 0
        self.id = MockManageableProduct.generateID()
        self.someProperty = 0
    }
    
    init(name: String, netPrice: Decimal, id: String) {
        self.name = name
        self.netPrice = netPrice
        self.quantity = 0
        self.id = id
        self.someProperty = 0
    }
}
