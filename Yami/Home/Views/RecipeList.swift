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
        let myList = fetcher.recipeAlphabetList
        NavigationView{
            List {
                ForEach(myList) { listItem in
                    Section(header: Text(listItem.name)) {
                        ForEach(listItem.recipes.meals) { recipe in
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
            .listStyle(GroupedListStyle())
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
