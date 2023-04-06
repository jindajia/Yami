//
//  RecipeCollectionFetcher.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import Foundation
import Combine
class RecipeCollectionFetcher: ObservableObject {
//    @Published var recipeCollection = RecipeCollection(meals: [Recipe.defaultRecipe])
    @Published var recipeDict: RecipeDict = RecipeDict(value: [:])
    @Published var recipeAlphabetList: [RecipeAlphabet] = []
    @Published var recipeCategoryModel: RecipeCategoryModel = RecipeCategoryModel(categorySet: Set<String>())
    var  cancellable = Set<AnyCancellable>()

    let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?f="
    var str = "a"
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    var cancellables = Set<AnyCancellable>()

    func fetchAllMeals() throws -> (){
        let str = "abcdefghijklmnopqrstuvwxyz"
        for char in str {
            try fetchDataFirstLetter(String(char))
        }
        print(self.recipeCategoryModel.categorySet)
    }
    
    func fetchDataFirstLetter(_ str: String) throws -> ()
    {
        print("fetchData start")
       guard let url = URL(string: urlString + str) else {
           return
       }
       
       return URLSession.shared.dataTaskPublisher(for: url)
           .tryMap { (data, response) -> Data in
               guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                   throw FetchError.badRequest
               }
               print("fetchData succed")
               return data
           }
           .decode(type: RecipeCollection.self, decoder: JSONDecoder())
           .receive(on: RunLoop.main)
           .sink(receiveCompletion: { completion in
               switch completion {
               case .finished:
                   break
               case .failure(let error):
                   print(error.localizedDescription)
               }}, receiveValue: { recipeCollection in
                   self.recipeDict.value[str] = RecipeAlphabet(name: str, recipes: recipeCollection)
                   var categorySet: Set<String> = self.recipeCategoryModel.categorySet
                   recipeCollection.meals.forEach{ meal in
                       if let category = meal.strCategory, !category.isEmpty {
                           categorySet.insert(category)
                       }
                   }
                   self.recipeCategoryModel.categorySet = categorySet
                   let rd = self.recipeDict.value
                   var myList: [RecipeAlphabet] = []
                   for key in rd.keys.sorted() {
                       myList.append(RecipeAlphabet(name: key, recipes: rd[key]?.recipes ?? RecipeCollection(meals: [])))
                   }
                   self.recipeAlphabetList = myList

               })
           .store(in: &cancellable)
    }
    
}
