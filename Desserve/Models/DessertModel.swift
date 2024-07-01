//
//  DessertModel.swift.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import Foundation

struct DessertResults: Codable {
    let meals: [Dessert]
}

struct Dessert: Codable, Identifiable, Hashable, Comparable {
    static func < (lhs: Dessert, rhs: Dessert) -> Bool {
        return lhs.name < rhs.name
    }
    
    var name: String = ""
    var image: String = ""
    var id: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case image = "strMealThumb"
        case id = "idMeal"
    }
    
    static func dessertExample() -> Dessert {
        Dessert(name: "Key Lime Pie", image: "https://www.themealdb.com//images//media//meals//qpqtuu1511386216.jpg", id: "52859")
    }
}
