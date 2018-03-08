//
//  Vendor.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol Vendor: AnyObject {
    var name: String { get }
    var address: Address { get set }
    var availableProducts: [ManageableProduct]? { get set }
    var commission: Double { get }
    var productManager: ProductManager { get }
}

protocol ProductManager {
    func addProduct(product: ManageableProduct)
    func removeProduct(id: Int)
    func removeProduct(index: Int)
    func removeAllProducts<T: ManageableProduct>(type: T.Type)
}
