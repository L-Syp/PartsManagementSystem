//
//  StandardProductManager.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

class StandardProductManager: ProductManaging {
    var vendor: Vendor
    
    func addProduct(product: ManageableProduct) throws {
        let productsWithId = vendor.availableProducts.filter{ $0.id == product.id }
        guard productsWithId.count == 0 else {
            throw ProductManagingError.DuplicatedId("Product with ID \(productsWithId[0].id) already exists.")
        }
        self.vendor.availableProducts.append(product)
    }
    
    func removeProduct(id: String) throws {
        let productWithId = vendor.availableProducts.filter{$0.id == id}
        guard productWithId.count == 0 else {
            throw ProductManagingError.ProductDoesNotExist("Product with id: \(id) does not exist.")
        }
        let index = self.vendor.availableProducts.index(where: {$0.id == id})
        self.vendor.availableProducts.remove(at: index!)
    }
    
    func removeProduct(at index: Int) throws {
        guard vendor.availableProducts.count >= index else {
            throw ProductManagingError.ProductDoesNotExist("Product with index: \(index) does not exist.")
        }
        vendor.availableProducts.remove(at: index)
    }
    
    func removeAllProducts<T>(ofType type: T.Type) -> Int where T : ManageableProduct {
        let filteredArray = self.vendor.availableProducts.flatMap { $0 as? T }
        guard filteredArray.count > 0 else { return 0 }
        
        for i in 0..<filteredArray.count {
            let index = self.vendor.availableProducts.index(where: {$0.id == filteredArray[i].id})
            self.vendor.availableProducts.remove(at: index!)
        }
        return filteredArray.count
    }
    init(vendor: Vendor) {
        self.vendor = vendor
    }
}
