//
//  StandardPriceCalculator.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

class StandardPriceCalculator: PriceCalculator {
    // MARK: Functions
    static func getNetPrice(of product: ManageableProduct) -> Double {
        return product.price
    }
    
    static func getGrossPrice(of product: ManageableProduct, in country: Country) -> Double {
        return product.price - product.price * country.tax
    }
    
    static func getFinalPrice(of product: ManageableProduct, from vendor: Vendor) -> Double {
        return product.price - product.price * (vendor.address.country.tax + vendor.commission)
    }
}
