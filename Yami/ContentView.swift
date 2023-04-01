//
//  ContentView.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import SwiftUI

struct ContentView: View, Sendable {
    @EnvironmentObject var fetcher: RecipeCollectionFetcher

    var body: some View {
        VStack {
            RecipeList()
                .environmentObject(fetcher)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = RecipeCollectionFetcher()
        ContentView()
            .environmentObject(fetcher)
    }
}
