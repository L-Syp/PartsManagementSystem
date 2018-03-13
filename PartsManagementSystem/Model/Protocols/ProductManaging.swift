//
//  ProductManaging.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol ProductManaging: AnyObject {
    var vendor: Vendor { get }
    func addProduct(product: ManageableProduct) throws
    func removeProduct(id: String) throws
    func removeProduct(at index: Int) throws
    func removeAllProducts<T: ManageableProduct>(ofType type: T.Type) -> Int
    func getProduct(id: String) throws -> ManageableProduct
    func getProduct(at index: Int) throws -> ManageableProduct
}

enum ProductManagingError: Error {
    case ProductAtIndexDoesNotExist(Int)
    case ProductWithIdDoesNotExist(String)
    case DuplicatedId(String)
}

// MARK: Extensions
extension ProductManaging {
    func addProduct(product: ManageableProduct) throws {
        let productsWithId = vendor.availableProducts.filter{ $0.id == product.id }
        guard productsWithId.count == 0 else {
            throw ProductManagingError.DuplicatedId(product.id)
        }
        self.vendor.availableProducts.append(product)
    }
    
    func removeProduct(id: String) throws {
        let productWithId = vendor.availableProducts.filter{$0.id == id}
        guard productWithId.count == 1 else {
            if productWithId.count == 0 { throw ProductManagingError.ProductWithIdDoesNotExist(id) } else {
                throw ProductManagingError.DuplicatedId(id)
            }
        }
        let index = self.vendor.availableProducts.index(where: {$0.id == id})
        self.vendor.availableProducts.remove(at: index!)
    }
    
    func removeProduct(at index: Int) throws {
        guard vendor.availableProducts.count >= index else {
            throw ProductManagingError.ProductAtIndexDoesNotExist(index)
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
    
    func getProduct(id: String) throws -> ManageableProduct {
        let productWithId = vendor.availableProducts.filter{$0.id == id}
        guard productWithId.count != 0 else {
            throw ProductManagingError.ProductWithIdDoesNotExist(id)
        }
        let index = self.vendor.availableProducts.index(where: {$0.id == id})
        return self.vendor.availableProducts[index!]
    }
    
    func getProduct(at index: Int) throws -> ManageableProduct {
        guard vendor.availableProducts.count > index else {
            throw ProductManagingError.ProductAtIndexDoesNotExist(index)
        }
        return vendor.availableProducts[index]
    }
}
