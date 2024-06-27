//
//  DessertModel.swift.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import Foundation


//struct Meals: Codable {
//    let meal: [Meal]
//}
//
//struct Meal: Codable, Identifiable, Hashable, Comparable {
//    static func < (lhs: Meal, rhs: Meal) -> Bool {
//        return lhs.strMeal < rhs.strMeal
//    }
//
//    let strMeal: String
//    let strMealThumb: String
//    let idMeal: String
//}

// struct Welcome: Codable {
// let meals: [[String: String?]]
// }


struct Dessert: Identifiable, Hashable, Comparable {
    static func < (lhs: Dessert, rhs: Dessert) -> Bool {
        return lhs.name < rhs.name
    }
    
    var id: Int
    var name: String
    var instructions: String
    var ingredients: String
}

extension Dessert {
    static var previewDesserts: [Dessert] {
        return [
            Dessert(id: 0, name: "Tiramisu", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 1, name: "Lemon Bars", instructions: "Pour lemon curd over shortbread and bake.", ingredients: "Lemon custard atop flaky shortbread"),
            Dessert(id: 2, name: "Chocolate Chip Cookies", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 3, name: "Angel Food Cake", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 4, name: "Saint Honore", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 5, name: "Parfait", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 6, name: "Black Forest Cake", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 7, name: "Apricot Rum Cake", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 8, name: "Monkey Bread", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 9, name: "Bananas Foster", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 10, name: "Baked Alaska", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 11, name: "Cinnamon Rolls", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 12, name: "Peach Cobbler", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 13, name: "Strawberry Tart", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 14, name: "Apple Crisp", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 15, name: "Cheese Danish", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
            Dessert(id: 16, name: "Coconut Cream Pie", instructions: "Soak lady fingers in espresso. Cover in marscarpone cream.", ingredients: "Coffee-soaked lady fingers chilled in marscarpone cream"),
        ]
    }
}
