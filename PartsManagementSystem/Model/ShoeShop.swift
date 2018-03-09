//
//  ShoeShop.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

class ShoeShop: Vendor {
    var name: String
    var address: Address
    var availableProducts: [ManageableProduct] = [ManageableProduct]()
    var commission: Double
    weak var productManager: ProductManaging? {
        get { return self.productManager }
        set { self.productManager = newValue }
    }
    
    init(name: String, address: Address, commission: Double, productManager: ProductManaging) {
        self.name = name
        self.address = address
        self.commission = commission
        self.productManager = productManager
        self.productManager?.vendor = self
    }
}
