//
//  MealCategoryView.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct MealCategoryView: View {
    @State private var imageLoadingFailed: Bool = false
    let category: MealCategory
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: category.strCategoryThumb))
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
                            .frame(width: 120, height: 90, alignment: .center)
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
                .frame(width: 120, height: 90, alignment: .center)
            
            Text(category.strCategory)
                .padding()
        }
        .frame(
            width: K.Dimensions.MealCategoryView.width,
            height: K.Dimensions.MealCategoryView.height,
            alignment: .center
        )
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: .shadowColor,
                    radius: 5,
                    x: 2,
                    y: 2
                )
        )
    }
}

struct MealCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MealCategoryView(category: MealCategory.sample)
    }
}
