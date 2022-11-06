//
//  MealCategory.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

struct MealCategoryAPIResponse: Decodable {
    let categories: [MealCategory]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
}

struct MealCategory: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    
    enum CodingKeys: String, CodingKey {
        case idCategory, strCategory, strCategoryThumb
    }
}

extension MealCategory {
    static let sample: MealCategory = MealCategory(
        idCategory: "1",
        strCategory: "Beef",
        strCategoryThumb : "https://www.themealdb.com/images/category/beef.png"
    )
    
}
