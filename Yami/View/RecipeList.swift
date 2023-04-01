//
//  RecipeList.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import SwiftUI
import Combine

struct RecipeList: View {
    @EnvironmentObject var fetcher: RecipeCollectionFetcher
    var body: some View {
        var  cancellable = Set<AnyCancellable>()
        List(fetcher.recipeCollection.meals, id: \.idMeal) { recipe in
            RecipeRow(recipe: recipe)
        }
        .onAppear{
            try? fetcher.fetchData()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }}, receiveValue: { recipeCollection in
                        self.fetcher.recipeCollection = recipeCollection
                    })
                .store(in: &cancellable)
        }
    }
}
struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
