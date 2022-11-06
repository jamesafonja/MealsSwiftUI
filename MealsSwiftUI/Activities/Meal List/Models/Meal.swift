//
//  Meal.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

struct MealAPIResponse: Decodable {
    let meals: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
}

struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    enum CodingKeys: String, CodingKey {
        case strMeal, strMealThumb, idMeal
    }
}

extension Meal {
    static let sample: Meal = Meal(
        strMeal: "Beef and Mustard Pie",
        strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
        idMeal: "52874"
    )
}
