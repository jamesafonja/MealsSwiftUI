//
//  MealListScreen.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealListScreen: View {
    
    @StateObject private var vm: MealListViewModel
    let category: String
    
    init(for category: String) {
        self.category = category
        let vm = MealListViewModel(category: category, service: APIHandler.shared)
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(vm.meals, id: \.idMeal) { meal in
                    MealListRow(meal: meal)
                }
            }
        }
        .navigationTitle(vm.navigationTitle(for: category))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            vm.getMeals { success in
                if success {
                    vm.meals.forEach { meal in
                        print(meal.strMeal)
                    }
                }
            }
        }

    }
}

struct MealListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealListScreen(for: "Beef")
    }
}
