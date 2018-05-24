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
    var manageableProducts = [ManageableProduct]()
    let arrayLength = 5
    let numberOfItemsToAdd = 3
    
    //MARK: Functions
    func generateData(arrayLength: Int) {
        for i in 0..<arrayLength {
            let product = MockManageableProduct(name: "Product \(i)", netPrice: Decimal((i+1))*5.5)
            manageableProducts.append(product)
        }
    }
    
    func addProducts(quantity: Int) -> ManageableProduct {
        var product = manageableProducts[arrayLength - 1]
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
        manageableProducts.removeAll()
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssert(manageableProducts.count == arrayLength)
        for i in 0..<arrayLength {
            let product = manageableProducts[i]
            XCTAssertEqual(product.name, "Product \(i)")
            XCTAssertEqual(product.quantity, 0)
            XCTAssert(Int(product.id)! >= 0 && Int(product.id)! <= Int32.max)
            XCTAssertNotNil(manageableProducts[i].id)
        }
    }
    
    func testAddingProducts() {
        let product = addProducts(quantity: numberOfItemsToAdd)
        XCTAssertEqual(product.quantity, numberOfItemsToAdd)
    }
    
    func testRemovingProducts() {
        continueAfterFailure = false
        var product = addProducts(quantity: numberOfItemsToAdd)
        XCTAssertNoThrow(try product.removeProduct(quantity: numberOfItemsToAdd))
        XCTAssertEqual(product.quantity, 0)
    }
    
    func testRemovingTooManyProducts() {
        continueAfterFailure = false
        var product = addProducts(quantity: numberOfItemsToAdd)
        XCTAssertThrowsError(try product.removeProduct(quantity: numberOfItemsToAdd + 1)) { error in
            XCTAssertEqual(error as? ProductError, ProductError.removingTooManyItemsError)
        }
    }
}
