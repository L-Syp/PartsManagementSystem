//
//  ManageableProduct.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

protocol ManageableProduct {
    var name: String { get }
    var id: String { get }
    var netPrice: Decimal { get set }
    var quantity: Int { get set }
    
    static func generateID() -> String
    mutating func addProduct()
    mutating func removeProduct(quantity: Int) throws
    mutating func changePrice(to netPrice: Decimal)
}

enum ProductError : String, Error {
    case removingTooManyItemsError = "Number of items to remove exceeds the total number of items in a collection."
}

// MARK: Extensions
extension ManageableProduct {
    // MARK: Functions
    internal static func generateID() -> String {
        return String(Int(arc4random_uniform(UInt32(Int32.max))))
    }
    
    mutating func addProduct() {
        self.quantity += 1
    }
    
    mutating func removeProduct(quantity: Int) throws {
        guard self.quantity >= quantity else {
            throw ProductError.removingTooManyItemsError
        }
        self.quantity -= quantity
    }
    
    mutating func changePrice(to netPrice: Decimal) {
        self.netPrice = netPrice
    }
}
