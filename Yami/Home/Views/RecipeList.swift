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
        NavigationView{
            let myList = fetcher.recipeAlphabetList
            List {
                ForEach(myList, id: \.self) { listItem in
                    Section(header: Text(listItem.name)) {
                        ForEach(listItem.recipes.meals, id: \.self) { recipe in
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                RecipeRow(recipe: recipe)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Meals")
        }
        .onAppear{
            try? fetcher.fetchAllMeals()
        }
    }
}
struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = RecipeCollectionFetcher()
        RecipeList()
            .environmentObject(fetcher)
    }
}
