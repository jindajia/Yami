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
    
    let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?f=a"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    var cancellables = Set<AnyCancellable>()

     func fetchData() async throws -> AnyPublisher<Void, Error>
    {
           guard let url = URL(string: urlString) else {
               return Fail(error: FetchError.badRequest).eraseToAnyPublisher()
           }
           
           return URLSession.shared.dataTaskPublisher(for: url)
               .tryMap { (data, response) -> Data in
                   guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                       throw FetchError.badRequest
                   }
                   return data
               }
               .decode(type: RecipeCollection.self, decoder: JSONDecoder())
               .map { collection in
                   self.recipeCollection = collection
               }
               .eraseToAnyPublisher()
    }
    
}
