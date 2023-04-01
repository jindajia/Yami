//
//  RecipeCollectionFetcher.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import Foundation
import Combine
class RecipeCollectionFetcher: ObservableObject {
    @Published var recipeCollection = RecipeCollection(meals: [Recipe.defaultRecipe])
    
    let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?f="
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    var cancellables = Set<AnyCancellable>()

    func fetchDataFirstLetter(_ str: String) throws -> AnyPublisher<RecipeCollection, Error>
    {
        print("fetchData start")
       guard let url = URL(string: urlString + str) else {
           return Fail(error: FetchError.badRequest).eraseToAnyPublisher()
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
           .eraseToAnyPublisher()
    }
    
}
