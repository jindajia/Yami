//
//  RecipeModel.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import Foundation

struct Recipe : Codable, Hashable {
    var idMeal: String
    var strMeal: String
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strTags: String?
    var strYoutube: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
    static let defaultRecipe = Recipe(idMeal: "00000",
                                        strMeal: "N/A")
}

struct RecipeCollection : Codable, Hashable {
    var meals: [Recipe]
}

struct RecipeAlphabet : Codable, Hashable{
    var name: String
    var recipes: RecipeCollection
}

struct RecipeDict : Codable, Hashable {
    var value: [String: RecipeAlphabet]
}
