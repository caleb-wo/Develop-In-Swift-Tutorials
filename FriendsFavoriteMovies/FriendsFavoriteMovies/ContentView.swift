//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Friends", systemImage: "person.and.person"){
                FriendList()
            }
            
            Tab("Movies", systemImage: "film.stack"){
                MovieList()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
