//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/24/25.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List{
                ForEach(movies){ movie in
                    NavigationLink(movie.title){
                        Text("Detail view for \(movie.title)")
                            .navigationTitle("Movie")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a Movie")
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
