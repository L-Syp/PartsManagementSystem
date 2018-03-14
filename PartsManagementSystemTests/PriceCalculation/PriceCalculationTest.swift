//
//  PriceCalculationTest.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 12/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

// MARK: Extensions
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

enum PriceFunctions {
    case netPrice
    case grossPrice
    case priceForCustomers
}

class PriceCalculationTest: XCTestCase {
    //MARK: Properties
    let decimalPlaces = 4
    
    //MARK: Functions
    func assertPrices(function: PriceFunctions, netPrice: Double, expectedValue: Double, tax: Double? = nil, comission: Double? = nil) {
        let product = MockManageableProduct(name: "-", netPrice: netPrice)
        switch function {
        case .netPrice:
            XCTAssertEqual(expectedValue, PriceCalculator.getNetPrice(of: product))
            
        case .grossPrice:
            let country = Country(name: "-", code: "-", flag: "-", tax: tax!)
            XCTAssertEqual(expectedValue.roundToDecimal(decimalPlaces), PriceCalculator.getGrossPrice(of: product, in: country).roundToDecimal(decimalPlaces))
            
        case .priceForCustomers:
            let country = Country(name: "-", code: "-", flag: "-", tax: tax!)
            let address = Address(streetName: "-", buildingNo: 0, flatNo: nil, zipcode: "-", country: country)
            let vendor = Shop(name: "-", address: address, commission: comission!)
            XCTAssertEqual(expectedValue.roundToDecimal(decimalPlaces), PriceCalculator.getPriceForCustomers(of: product, from: vendor).roundToDecimal(decimalPlaces))
        }
    }
    
    //MARK: Tests
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNetPrice() {
        let testData = [
            (1243.23),
            (32.23),
            (7645.32),
            (234.43),
            (423.41)
        ]
        testData.forEach({
            assertPrices(function: .netPrice, netPrice: $0, expectedValue: $0)
        })
    }
    
    func testGrossPrice() {
        let testData = [
            (1243.23, 1522.086489, 22.43),
            (32.23, 53.927236, 67.32),
            (7645.32, 7711.069752, 0.86),
            (234.43, 284.949665, 21.55),
            (423.41, 503.8579, 19.0)
        ]
        testData.forEach({
            assertPrices(function: .grossPrice, netPrice: $0, expectedValue: $1, tax: $2)
        })
    }
    
    func testPriceForCustomers() {
        let testData = [
            (23212.12, 40024.65852, 22.43, 50),
            (10, 17.055, 67.32, 3.23),
            (43.45, 52.743955, 0.86, 20.53),
            (994.12, 1328.14432, 21.55, 12.05),
            (20053.9, 30947.17848, 19, 35.32)
        ]
        testData.forEach({
            assertPrices(function: .priceForCustomers, netPrice: $0, expectedValue: $1, tax: $2, comission: $3)
        })
    }
    
    
}
