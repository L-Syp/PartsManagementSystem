//
//  ManageableProductMockClass.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//
import Foundation
@testable import PartsManagementSystem

class ManageableProductMockClass: ManageableProduct {
    // MARK: Properties
    var name: String
    var id: String
    var price: Double
    internal var quantity: Int
    
    // MARK: Functions
    internal static func generateID() -> String {
        return String(Int(arc4random_uniform(UInt32.max -  1)))
    }
    
    func addProduct() {
        self.quantity += 1
    }
    
    func removeProduct(quantity: Int) throws {
        guard self.quantity >= quantity else {
            throw ProductError.removingItemsError("Cannot remove more items than there are already in store")
        }
        self.quantity -= quantity
    }
    
    //MARK: Initializers
    init(name: String, price: Double) {
        self.name = name
        self.price = price
        self.quantity = 0
        self.id = ManageableProductMockClass.generateID()
    }
    
    init(name: String, price: Double, id: String) {
        self.name = name
        self.price = price
        self.quantity = 0
        self.id = id
    }
}
