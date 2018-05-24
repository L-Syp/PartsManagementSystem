//
//  Vendor.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

protocol Vendor: AnyObject {
    var name: String { get }
    var address: AddressProtocol { get set }
    var availableProducts: [ManageableProduct] { get set}
    var commission: Decimal { get }
    static var priceCalculator: PriceCalculation { get set }
}
