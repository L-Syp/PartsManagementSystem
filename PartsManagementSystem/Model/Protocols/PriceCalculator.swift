//
//  PriceCalculator.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol PriceCalculator {
    static func getNetPrice(of product: ManageableProduct) -> Double
    static func getGrossPrice(of product: ManageableProduct, in country: Country) -> Double
    static func getFinalPrice(of product: ManageableProduct, from vendor: Vendor) -> Double
}
