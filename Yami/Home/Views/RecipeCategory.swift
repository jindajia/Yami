//
//  RecipeCategory.swift
//  Yami
//
//  Created by 贾金达 on 4/5/23.
//

import SwiftUI

struct RecipeCategory: View {
    @EnvironmentObject var fetcher: RecipeCollectionFetcher
    @State private var selectedOption: String = "Dessert"
    var body: some View {
        Picker("Options", selection: $selectedOption) {
            ForEach(Array(fetcher.recipeCategoryModel.categorySet).sorted(), id: \.self) { option in
                Text(option)
            }
        }
    }
}

struct RecipeCategory_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = RecipeCollectionFetcher()
        RecipeCategory()
            .environmentObject(fetcher)
    }
}
