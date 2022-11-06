//
//  MealListRow.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct MealListRow: View {
    @State private var imageLoadingFailed = false
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        HStack(spacing: 20) {
            WebImage(url: URL(string: meal.strMealThumb))
                .onSuccess { image, data, cacheType in
                    
                }
                .onFailure { _ in
                    imageLoadingFailed = true
                }
                .resizable()
                .placeholder(Image(uiImage: UIImage(named: "defaultImage") ?? UIImage()))
                .placeholder {
                    if imageLoadingFailed {
                        Image(uiImage: UIImage(named: "defaultImage") ?? UIImage())
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.gray.opacity(0.4))
                            .frame(width: 75, height: 75, alignment: .center)
                    } else {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.7))
                            .cornerRadius(10)
                            .opacity(0.2)
                    }
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .cornerRadius(5)
                .frame(width: 75, height: 75, alignment: .center)
            
            VStack {
                Text(meal.strMeal)
                    .lineLimit(3)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            Color.white
                .cornerRadius(8)
                .shadow(
                    color: .shadowColor,
                    radius: 5,
                    x: 2,
                    y: 2
                )
        )
        .padding(.horizontal, 10)
    }
}

struct MealListRow_Previews: PreviewProvider {
    static var previews: some View {
        MealListRow(meal: Meal.sample)
    }
}
