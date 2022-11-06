//
//  MealListViewModel.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

class MealListViewModel: BaseViewModel {
    let category: String
    let service: APIService
    let urlString: String
    
    @Published var meals: [Meal] = []
    @Published var hasError: Bool = false
    
    var statusMessage: String = ""

    init(category: String, service: APIService) {
        self.category = category
        self.service = service
        self.urlString = APIUrl.baseListUrl.description + category.capitalized
    }
    
    func getMeals(completion: @escaping (_ success: Bool) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        
        service.fetchObject(from: url, memberType: MealAPIResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
                completion(false)
            case .success(let apiResponse):
                DispatchQueue.main.async {
                    self?.meals = apiResponse.meals
                    completion(true)
                }
            }
        }
        
    }
    
    func navigationTitle(for category: String) -> String {
        return "All " + category + " Recipes"
    }
}
