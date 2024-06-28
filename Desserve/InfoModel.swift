//
//  MealModel.swift
//  Desserve
//
//  Created by Sam Cook on 6/27/24.
//

import Foundation

struct InfoResults: Codable {
    let meals: [Info]
}

struct Info: Codable {
    let id: String
    let meal: String
    let category: String
    let instructions: String
    let thumbnail: String
    let tags: String
    let youtube: String
    let source: String 

idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String
    let strYoutube: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String
    
    enum CodingKeys: String, CodingKey {
        
        
    }
    
    static func infoExample() -> Info {
        Info(idMeal: "52893", strMeal: "Apple & Blackberry Crumble", strCategory: "Dessert", strInstructions: "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg", strTags: "Pudding", strYoutube: "https://www.youtube.com/watch?v=4vhcOwVBDO4", strSource: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble", strIngredient1: "Plain Flour", strMeasure1: "120g")
    }
}
