//
//  ManageableProduct.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

protocol ManageableProduct: NSObjectProtocol {
    var name: String { get }
    var id: Int { get }
    var price: Double { get set }
    var vendor: [Vendor]? { get set }
    
    func getNetPrice() -> Double
    func getGrossPrice() -> Double
    func getFinalPrice() -> Double
    func generateID() -> Double
}
