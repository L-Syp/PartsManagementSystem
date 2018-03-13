//
//  ProductManager.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

class ProductManager: ProductManaging {
    var vendor: Vendor
    
    // MARK: Properties
    
    // MARK: Functions
    
    //MARK: Initializers
    init(vendor: Vendor) {
        self.vendor = vendor
    }
}
