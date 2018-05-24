//
//  PriceCalculation.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

protocol PriceCalculation {
    static func getNetPrice(of product: ManageableProduct) -> Decimal
    static func getGrossPrice(of product: ManageableProduct, in country: Country) -> Decimal
    static func getPriceForCustomers(of product: ManageableProduct, from vendor: Vendor) -> Decimal
}

// MARK: Extensions
extension PriceCalculation {
    static func getNetPrice(of product: ManageableProduct) -> Decimal {
        return product.netPrice
    }
    
    static func getGrossPrice(of product: ManageableProduct, in country: Country) -> Decimal {
        return product.netPrice * (1 + 0.01 * country.tax)
    }
    
    static func getPriceForCustomers(of product: ManageableProduct, from vendor: Vendor) -> Decimal {
         return product.netPrice * (1 + 0.01 * vendor.address.country.tax + 0.01 * vendor.commission)
    }
}
