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
    
    //MARK: Functions
    func assertPrices(function: PriceFunctions, netPrice: Decimal, expectedValue: Decimal, tax: Decimal? = nil, comission: Decimal? = nil) {
        let product = MockManageableProduct(name: "-", netPrice: netPrice)
        switch function {
        case .netPrice:
            XCTAssertEqual(expectedValue, PriceCalculator.getNetPrice(of: product))
            
        case .grossPrice:
            let country = Country(name: "-", code: "-", flag: "-", tax: tax!)
            XCTAssertEqual(expectedValue, PriceCalculator.getGrossPrice(of: product, in: country))
            
        case .priceForCustomers:
            let country = Country(name: "-", code: "-", flag: "-", tax: tax!)
            let address = Address(streetName: "-", buildingNo: 0, flatNo: nil, zipcode: "-", country: country)
            let vendor = Shop(name: "-", address: address, commission: comission!)
            XCTAssertEqual(expectedValue, PriceCalculator.getPriceForCustomers(of: product, from: vendor))
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
            (Decimal(1243.23)),
            (Decimal(32.23)),
            (Decimal(7645.32)),
            (Decimal(234.43)),
            Decimal((423.41))
        ]
        testData.forEach({
            assertPrices(function: .netPrice, netPrice: $0, expectedValue: $0)
        })
    }
    
    func testGrossPrice() {
        let testData = [
            (Decimal(1243.23), Decimal(1522.086489), Decimal(22.43)),
            (Decimal(32.23), Decimal(53.927236), Decimal(67.32)),
            (Decimal(7645.32), Decimal(7711.069752), Decimal(0.86)),
            (Decimal(234.43), Decimal(284.949665), Decimal(21.55)),
            (Decimal(423.41), Decimal(503.8579), Decimal(19.0))
        ]
        testData.forEach({
            assertPrices(function: .grossPrice, netPrice: $0, expectedValue: $1, tax: $2)
        })
    }
    
    func testPriceForCustomers() {
        let testData = [
            (Decimal(23212.12), Decimal(40024.65852), Decimal(22.43), Decimal(50)),
            (Decimal(10), Decimal(17.055), Decimal(67.32), Decimal(3.23)),
            (Decimal(43.45), Decimal(52.743955), Decimal(0.86), Decimal(20.53)),
            (Decimal(994.12), Decimal(1328.14432), Decimal(21.55), Decimal(12.05)),
            (Decimal(20053.9), Decimal(30947.17848), Decimal(19), Decimal(35.32))
        ]
        testData.forEach({
            assertPrices(function: .priceForCustomers, netPrice: $0, expectedValue: $1, tax: $2, comission: $3)
        })
    }
    
    
}
