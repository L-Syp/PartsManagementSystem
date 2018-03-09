//
//  ManageableProduct.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol ManageableProduct: AnyObject {
    var name: String { get }
    var id: String { get }
    var price: Double { get set }
    var quantity: Int {get set}
    
    static func generateID() -> String
    func addProduct()
    func removeProduct(quantity: Int) throws
}

enum ProductError : Error {
    case removingItemsError(String)
}