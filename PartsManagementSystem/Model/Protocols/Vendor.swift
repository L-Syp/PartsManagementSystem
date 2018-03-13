//
//  Vendor.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol Vendor: AnyObject {
    var name: String { get }
    var address: AddressProtocol { get set }
    var availableProducts: [ManageableProduct] { get set}
    var commission: Double { get }
    static var priceCalculator: PriceCalculation { get set }
}
