import UIKit

class Product {
    var name: String
    var price: Double
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

class Inventory {
    var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    // calculate total inventory value
    func totalInventoryValue() -> Double {
        return products.reduce(0.0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    // find the most expensive product
    func mostExpensiveProduct() -> String? {
        return products.max(by: { $0.price < $1.price })?.name
    }
    
    // check if product named "Headphones" is in stock
    func isProductInStock(named productName: String) -> Bool {
        return products.contains { $0.name == productName && $0.quantity > 0 }
    }
    
    // sort products by price or quantity
    func sortProducts(by criteria: String, ascending: Bool) -> [Product] {
        switch criteria.lowercased() {
        case "price":
            return ascending ? products.sorted(by: { $0.price < $1.price }) :
                               products.sorted(by: { $0.price > $1.price })
        case "quantity":
            return ascending ? products.sorted(by: { $0.quantity < $1.quantity }) :
                               products.sorted(by: { $0.quantity > $1.quantity })
        default:
            return products
        }
    }
}

// Sample products
let laptop = Product(name: "Laptop", price: 999.99, quantity: 5)
let smartphone = Product(name: "Smartphone", price: 499.99, quantity: 10)
let tablet = Product(name: "Tablet", price: 299.99, quantity: 0)
let smartwatch = Product(name: "Smartwatch", price: 199.99, quantity: 3)

let inventory = Inventory(products: [laptop, smartphone, tablet, smartwatch])

// Calculate total inventory value
let totalValue = inventory.totalInventoryValue()
print("Total inventory value: \(totalValue)")

// Find the most expensive product
if let mostExpensive = inventory.mostExpensiveProduct() {
    print("Most expensive product: \(mostExpensive)")
} else {
    print("No products available.")
}

// Check if "Headphones" is in stock
let isInStock = inventory.isProductInStock(named: "Headphones")
print("Is Headphones in stock? \(isInStock)")

// Sort products by price in descending order
let sortedByPriceDesc = inventory.sortProducts(by: "price", ascending: false)
print("Products sorted by price (descending):")
for product in sortedByPriceDesc {
    print("\(product.name): \(product.price)")
}
