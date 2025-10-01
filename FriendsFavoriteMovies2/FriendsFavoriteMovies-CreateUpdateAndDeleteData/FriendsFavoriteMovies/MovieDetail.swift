//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/30/25.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form{
            TextField("Title", text: $movie.title)
            
            DatePicker("Release Date:",
                       selection: $movie.releaseDate,
                       displayedComponents: .date)
        }
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie)
    }
}
