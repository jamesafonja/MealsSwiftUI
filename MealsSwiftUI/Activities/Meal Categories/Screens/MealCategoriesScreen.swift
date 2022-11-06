//
//  MealCategoriesScreen.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import SwiftUI

struct MealCategoriesScreen: View {
    @StateObject private var vm: MealCategoriesViewModel
    
    init() {
        let vm = MealCategoriesViewModel(service: APIHandler.shared)
        _vm = StateObject(wrappedValue: vm)
    }
    
    let columns = [
        GridItem(
            .flexible(maximum: UIScreen.main.bounds.width * 0.44),
            spacing: UIScreen.main.bounds.width * 0.04
        ),
        GridItem(
            .flexible(maximum: K.Dimensions.MealCategoryView.width),
            spacing: K.Dimensions.MealCategoryView.gridItemSpacing
        )
    ]

    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: K.Dimensions.MealCategoryView.gridItemSpacing
                ) {
                    ForEach(vm.categories, id: \.idCategory) { category in
                            
                        NavigationLink {
                            MealListScreen(for: category.strCategory.capitalized)
                        } label: {
                            MealCategoryView(category: category)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.top)
            }
        }
        .navigationTitle("Categories")
        .onAppear {
            vm.getMealCategories { success in
                print("SUCCESSFULLY FETCHED CATEGORIES")
            }
        }
    }
}

struct MealCategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealCategoriesScreen()
    }
}
