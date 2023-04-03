//
//  LoadableImageView.swift
//  Yami
//
//  Created by 贾金达 on 4/2/23.
//

import SwiftUI

struct LoadableImageView: View {
    var recipe: Recipe

    var body: some View {
        if let url_str = recipe.strMealThumb, url_str.count > 0 {
            AsyncImage(url: URL(string:url_str)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .accessibility(hidden: false)
                        .accessibilityLabel(Text(recipe.strMeal))
                }  else if phase.error != nil  {
                    VStack {
                        Image("pandaplaceholder")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                        Text("The pandas were all busy.")
                            .font(.title2)
                        Text("Please try again.")
                            .font(.title3)
                    }

                } else {
                    ProgressView()
                }
            }
        } else {
            Image("mealplaceholder")
        }
    }
}

struct LoadableImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImageView(recipe: Recipe(idMeal: "53049",
                                         strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", strIngredient1: "Milk", strMeasure1: "60ML"))
    }
}
