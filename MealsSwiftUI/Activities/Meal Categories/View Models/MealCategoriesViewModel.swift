//
//  MealCategoriesViewModel.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

class MealCategoriesViewModel: BaseViewModel {
    
    let service: APIService
    let urlString: String
    
    @Published var categories: [MealCategory] = []
    @Published var hasError: Bool = false
    var statusMessage: String = ""
    
    init(service: APIService) {
        self.service = service
        self.urlString = APIUrl.categoriesUrl.description
    }
    
    func getMealCategories(completion: @escaping (_ success: Bool) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        
        service.fetchObject(from: url, memberType: MealCategoryAPIResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                completion(false)
                print(error)
            case .success(let jsonResponse):
                DispatchQueue.main.async {
                    self?.categories = jsonResponse.categories
                    completion(true)
                }
            }
        }
    }
    
    func setStatus(message: String, error: Error?) {
        
    }

}
