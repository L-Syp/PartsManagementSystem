//
//  ProductManaging.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol ProductManaging: AnyObject {
    var vendor: Vendor { get set }
    func addProduct(product: ManageableProduct) throws
    func removeProduct(id: String) throws
    func removeProduct(at index: Int) throws
    func removeAllProducts<T: ManageableProduct>(ofType type: T.Type) -> Int
}
