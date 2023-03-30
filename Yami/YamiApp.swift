//
//  YamiApp.swift
//  Yami
//
//  Created by 贾金达 on 3/30/23.
//

import SwiftUI

@main
struct YamiApp: App {
    @StateObject private var fetcher = RecipeCollectionFetcher()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fetcher)
        }
    }
}
