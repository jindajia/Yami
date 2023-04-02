//
//  RecipeDetailView.swift
//  Yami
//
//  Created by 贾金达 on 4/2/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text(recipe.strMeal)
                    .font(.title)
                Divider()
                VStack {
                    LoadableImageView(recipe: recipe)
                    Text("Instructions")
                        .font(.title2)
                    Text(recipe.strInstructions ?? "")
                }
                VStack {

                    HStack{
                        Text("Ingredient")
                            .font(.title2)
                        Spacer()
                        Text("Measure")
                            .font(.title2)
                    }
                    Group{
                        HStack{
                            if let ing = recipe.strIngredient1, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure1, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient2, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure2, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient3, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure3, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient4, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure4, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient5, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure5, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient6, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure6, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient7, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure7, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient8, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure8, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient9, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure9, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient10, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure10, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                    }
                    Group{
                        HStack{
                            if let ing = recipe.strIngredient11, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure11, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient12, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure12, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient13, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure13, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient14, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure14, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient15, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure15, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient16, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure16, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient17, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure17, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient18, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure18, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient19, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure19, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                        HStack{
                            if let ing = recipe.strIngredient20, ing.count > 0{
                                Text(ing)
                                Spacer()
                                if let mes = recipe.strMeasure20, mes.count > 0 {
                                    Text(mes)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(recipe.strMeal)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let recipeExp = Recipe(idMeal: "53049",
                               strMeal: "Apam balik", strInstructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.",strIngredient1: "Milk", strMeasure1: "60ML")
        RecipeDetailView(recipe: recipeExp)
    }
}
