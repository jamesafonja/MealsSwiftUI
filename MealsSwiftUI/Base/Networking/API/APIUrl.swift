//
//  APIUrl.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

enum APIUrl: CustomStringConvertible {
    private static let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    
    case categoriesUrl, baseListUrl, baseRecipeUrl

    var description: String {
        switch self {
            case .categoriesUrl: return APIUrl.baseUrl + "categories.php"
            case .baseListUrl: return APIUrl.baseUrl + "filter.php?c="
            case .baseRecipeUrl: return APIUrl.baseUrl + "lookup.php?i="
        }
    }
}
