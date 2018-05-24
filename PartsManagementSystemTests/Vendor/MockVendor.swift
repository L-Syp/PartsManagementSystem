//
//  MockVendor.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 12/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

class MockVendor: Vendor {
    var name: String
    var address: AddressProtocol
    var availableProducts: [ManageableProduct] = [ManageableProduct]()
    var commission: Decimal
    static var priceCalculator: PriceCalculation { set { Shop.priceCalculator = newValue } get { return Shop.priceCalculator } }
    
    init(name: String, address: AddressProtocol, commission: Decimal) {
        self.name = name
        self.address = address
        self.commission = commission
    }
}
