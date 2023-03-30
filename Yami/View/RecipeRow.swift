//
//  RecipeRow.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    var body: some View {
        Text(recipe.idMeal)
        Text(recipe.strMeal)
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe.defaultRecipe)
    }
}
