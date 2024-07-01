//
//  InfoResults.swift
//  Desserve
//
//  Created by Sam Cook on 6/27/24.
//
import Foundation

struct InfoResults: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Hashable {
    let idMeal: String?
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strDrinkAlternate
        case strCategory
        case strArea
        case strInstructions
        case strMealThumb
        case strTags
        case strYoutube
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(idMeal: String? = nil,
         strMeal: String? = nil,
         strDrinkAlternate: String? = nil,
         strCategory: String? = nil,
         strArea: String? = nil,
         strInstructions: String? = nil,
         strMealThumb: String? = nil,
         strTags: String? = nil,
         strYoutube: String? = nil,
         ingredients: [Ingredient] = []) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strDrinkAlternate = strDrinkAlternate
        self.strCategory = strCategory
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strTags = strTags
        self.strYoutube = strYoutube
        self.ingredients = ingredients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decodeIfPresent(String.self, forKey: .idMeal)
        strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
        strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory)
        strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
        strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        
        var ingredientsArray: [Ingredient] = []
        for i in 1...20 {
            guard let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)") else {
                continue
            }
            let measureKey = CodingKeys(rawValue: "strMeasure\(i)")!
            
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient.isEmpty {
                let measure = try container.decodeIfPresent(String.self, forKey: measureKey)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                let ingredientObject = Ingredient(name: ingredient, measure: measure)
                ingredientsArray.append(ingredientObject)
            }
        }
        ingredients = ingredientsArray
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(idMeal, forKey: .idMeal)
        try container.encodeIfPresent(strMeal, forKey: .strMeal)
        try container.encodeIfPresent(strDrinkAlternate, forKey: .strDrinkAlternate)
        try container.encodeIfPresent(strCategory, forKey: .strCategory)
        try container.encodeIfPresent(strArea, forKey: .strArea)
        try container.encodeIfPresent(strInstructions, forKey: .strInstructions)
        try container.encodeIfPresent(strMealThumb, forKey: .strMealThumb)
        try container.encodeIfPresent(strTags, forKey: .strTags)
        try container.encodeIfPresent(strYoutube, forKey: .strYoutube)
        
        for (index, ingredient) in ingredients.enumerated() {
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(index + 1)")!
            let measureKey = CodingKeys(rawValue: "strMeasure\(index + 1)")!
            try container.encode(ingredient.name, forKey: ingredientKey)
            try container.encode(ingredient.measure, forKey: measureKey)
        }
    }
    
    struct Ingredient: Codable, Hashable {
        let name: String
        let measure: String
    }
}
