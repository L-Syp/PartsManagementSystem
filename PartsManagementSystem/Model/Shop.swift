//
//  Shop.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

class Shop: Vendor {
    var name: String
    var address: AddressProtocol
    var availableProducts: [ManageableProduct] = [ManageableProduct]()
    var commission: Double
    static var priceCalculator: PriceCalculation { set { Shop.priceCalculator = newValue } get { return Shop.priceCalculator } }
    
    init(name: String, address: Address, commission: Double) {
        self.name = name
        self.address = address
        self.commission = commission
    }
}
