//
//  ProductManagingTests.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 12/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

class ProductManagingTests: XCTestCase {
    var products = [ManageableProduct]()
    var country = Country(name: "-", code: "-", flag: "-", tax: 0.0)
    lazy var address = MockAddress(streetName: "", buildingNo: 0, flatNo: nil, zipcode: "", country: country)
    lazy var vendor = MockVendor(name: "-", address: address, commission: 0.0)
    lazy var productManager = MockProductManager(vendor: vendor)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        vendor.availableProducts.removeAll()
        products.removeAll()
        super.tearDown()
    }
    
    func testAddProducts() {
        var products = [ManageableProduct]()
        let numberOfItems = 4
        
        for i in 0..<numberOfItems {
            products.append(MockManageableProduct(name: "Item\(i)", netPrice: Double(i)))
        }
        for i in 0..<products.count {
            XCTAssertNoThrow(try productManager.addProduct(product: products[i]))
        }
        XCTAssertEqual(productManager.vendor.availableProducts.count, numberOfItems)
    }
    
    func testAddProductsWithEqualIDs() {
        let numberOfItems = 4
        let id = "ID"
        
        for i in 0..<numberOfItems {
            products.append(MockManageableProduct(name: "Item\(i)", netPrice: Double(i), id: id))
        }
        for i in 0..<products.count {
            if i == 0 {
                XCTAssertNoThrow(try productManager.addProduct(product: products[i]))
            } else {
                XCTAssertThrowsError(try productManager.addProduct(product: products[i]))
            }
        }
        XCTAssertEqual(productManager.vendor.availableProducts.count, 1)
    }
    
    func testRemoveProductById() {
        let numberOfItems = 4
        var IDsArray = [String]()
        
        for i in 0..<numberOfItems {
            let product = MockManageableProduct(name: "Item\(i)", netPrice: Double(i))
            XCTAssertNoThrow(try productManager.addProduct(product: product))
            IDsArray.append(product.id)
        }
        
        let initialProductsNumber = productManager.vendor.availableProducts.count
        for i in 0..<initialProductsNumber {
            XCTAssertNoThrow(try productManager.removeProduct(id: IDsArray[i]))
            let currentProductsNumber = productManager.vendor.availableProducts.count
            XCTAssertEqual(initialProductsNumber - i - 1 , currentProductsNumber)
        }
        XCTAssertEqual(productManager.vendor.availableProducts.count, 0)
    }
    
    func testRemoveProductByIndex() {
        let numberOfItems = 4
        for i in 0..<numberOfItems {
            let product = MockManageableProduct(name: "Item\(i)", netPrice: Double(i))
            XCTAssertNoThrow(try productManager.addProduct(product: product))
        }
        
        let initialProductsNumber = productManager.vendor.availableProducts.count
        for i in 0..<initialProductsNumber {
            XCTAssertNoThrow(try productManager.removeProduct(at: 0))
            let currentProductsNumber = productManager.vendor.availableProducts.count
            XCTAssertEqual(initialProductsNumber - i - 1 , currentProductsNumber)
        }
        XCTAssertEqual(productManager.vendor.availableProducts.count, 0)
    }
    
    func testRemoveProductsByType() {
        let numberOfMockItems = 4
        let numberOfAnotherTypeMockItems = 7
        let initialNumberOfItems = numberOfMockItems + numberOfAnotherTypeMockItems
        
        for i in 0..<numberOfMockItems {
            let product = MockManageableProduct(name: "Item\(i)", netPrice: Double(i))
            XCTAssertNoThrow(try productManager.addProduct(product: product))
        }
        for i in 0..<numberOfAnotherTypeMockItems {
            let product = MockManageableAnotherProduct(name: "Item\(i)", netPrice: Double(i))
            XCTAssertNoThrow(try productManager.addProduct(product: product))
        }
        XCTAssertEqual(initialNumberOfItems, productManager.vendor.availableProducts.count)
        
        let numberOfDeletedProducts = productManager.removeAllProducts(ofType: MockManageableProduct.self)
        XCTAssertEqual(numberOfMockItems, numberOfDeletedProducts)
        XCTAssertEqual(initialNumberOfItems - numberOfMockItems, productManager.vendor.availableProducts.count)
        
        let numberOfDeletedAnotherProducts = productManager.removeAllProducts(ofType: MockManageableAnotherProduct.self)
        XCTAssertEqual(numberOfAnotherTypeMockItems, numberOfDeletedAnotherProducts)
        XCTAssertEqual(0, productManager.vendor.availableProducts.count)
    }
    
    func testGetProductByID() {
        let numberOfItems = 4
        let itemName = "Item"
        
        for i in 0..<numberOfItems {
            let product = MockManageableProduct(name: "\(itemName)\(i)", netPrice: Double(i), id: String(i))
            XCTAssertNoThrow(try productManager.addProduct(product: product))
        }
        for i in 0..<numberOfItems + 1 {
            if i < numberOfItems {
                XCTAssertNoThrow(try productManager.getProduct(id: String(i)))
                do {
                    let product = try productManager.getProduct(id: String(i))
                    XCTAssertEqual(String(i), product.id)
                    XCTAssertEqual("\(itemName)\(i)", product.name)
                } catch {}
            } else {
                XCTAssertThrowsError(try productManager.getProduct(id: String(i)))
            }
        }
    }
    
    func testGetProductByIndex() {
        let numberOfItems = 4
        let itemName = "Item"
        
        for i in 0..<numberOfItems {
            let product = MockManageableProduct(name: "\(itemName)\(i)", netPrice: Double(i))
            XCTAssertNoThrow(try productManager.addProduct(product: product))
        }
        for i in 0..<numberOfItems + 1 {
            if i < numberOfItems {
                XCTAssertNoThrow(try productManager.getProduct(at: i))
                do {
                    let product = try productManager.getProduct(at: i)
                    XCTAssertEqual("\(itemName)\(i)", product.name)
                } catch {}
            } else {
                XCTAssertThrowsError(try productManager.getProduct(at: i))
            }
        }
        productManager.vendor.availableProducts.append(MockManageableProduct(name: "sda", netPrice: Double(4)))
    }
}


