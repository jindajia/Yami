//
//  RecipesLoader.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import Foundation

//var meals: Meals = load("meals.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadRecipes(_ filename: String) -> [Recipe] {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        let recipecollection = try decoder.decode(RecipeCollection.self, from: data)
        return recipecollection.meals
    } catch {
        fatalError("Couldn't parse \(filename) as \(RecipeCollection.self):\n\(error)")
    }
}

