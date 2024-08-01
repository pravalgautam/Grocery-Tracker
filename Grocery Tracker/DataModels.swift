//
//  DataModels.swift
//  Grocery Tracker
//
//  Created by Praval Gautam on 01/08/24.
//

import Foundation

struct ExpiredProducts{
    var id = UUID()
    let image : String
    let itemName: String
}

struct ExpiredSoon{
    var id = UUID()
    let image : String
    let itemName: String
    let date : String
}

let expiredProductData: [ExpiredProducts] = [
    ExpiredProducts(image: "veg1", itemName: "Onion"),
    ExpiredProducts(image: "r3", itemName: "Apple"),
    ExpiredProducts(image: "e1", itemName: "Carrot"),
    ExpiredProducts(image: "e2", itemName: "Broccoli"),
    ExpiredProducts(image: "e3", itemName: "Spinach"),
    ExpiredProducts(image: "e6", itemName: "Potato"),
    ExpiredProducts(image: "e7", itemName: "Cucumber")
]
let expiredSoonData: [ExpiredSoon] = [
    ExpiredSoon(image: "e9", itemName: "Avocado", date: "22/2/24"),
    ExpiredSoon(image: "r2", itemName: "Red Peeper", date: "23/2/24"),
    ExpiredSoon(image: "e1", itemName: "Apple", date: "24/2/24"),
    ExpiredSoon(image: "r4", itemName: "Apple", date: "24/2/24"),
    ExpiredSoon(image: "r5", itemName: "Apple", date: "24/2/24"),
    ExpiredSoon(image: "e1", itemName: "Apple", date: "24/2/24"),
    ExpiredSoon(image: "e2", itemName: "Apple", date: "24/2/24"),
    ExpiredSoon(image: "e3", itemName: "Apple", date: "24/2/24"),
    ExpiredSoon(image: "e4", itemName: "Apple", date: "24/2/24"),
]
