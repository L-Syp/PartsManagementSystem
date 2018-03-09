//
//  ManageableProductTests.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

class ManageableProductTests: XCTestCase {
    
    //MARK: Properties
    var ManageableProducts: [ManageableProduct] = [ManageableProduct]()
    let arrayLength = 5
    let numberOfItemsToAdd = 3
    
    //MARK: Functions
    func generateData(arrayLength: Int) {
        for i in 0..<arrayLength {
            let product = ManageableProductMockClass(name: "Product \(i)", price: Double((i+1))*5.5)
            ManageableProducts.append(product)
        }
    }
    
    func addProducts(quantity: Int) -> ManageableProduct {
        let product = ManageableProducts[arrayLength - 1]
        for _ in 0..<quantity {
            product.addProduct()
        }
        return product
    }
    
    //MARK: Tests
    override func setUp() {
        generateData(arrayLength: arrayLength)
        super.setUp()
    }
    
    override func tearDown() {
        ManageableProducts.removeAll()
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssert(ManageableProducts.count == arrayLength)
        for i in 0..<arrayLength {
            XCTAssertEqual(ManageableProducts[i].name, "Product \(i)")
            XCTAssertEqual(ManageableProducts[i].quantity, 0)
            XCTAssertNotNil(ManageableProducts[i].id)
        }
    }
    
    func testAddingProducts() {
        let product = addProducts(quantity: numberOfItemsToAdd)
        XCTAssertEqual(product.quantity, numberOfItemsToAdd)
    }
    
    func testRemovingProducts() {
        continueAfterFailure = false
        let product = addProducts(quantity: numberOfItemsToAdd)
        XCTAssertNoThrow(try product.removeProduct(quantity: numberOfItemsToAdd))
        XCTAssertEqual(product.quantity, 0)
    }
    
}
