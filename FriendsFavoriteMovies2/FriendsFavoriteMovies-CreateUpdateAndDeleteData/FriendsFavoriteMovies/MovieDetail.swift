//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/30/25.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    @Environment(\.dismiss) var dismiss
    private var isNew: Bool
    
    init(_ movie: Movie, isNew: Bool = false){
        self.movie = movie
        self.isNew = isNew
    }
    
    var body: some View {
        Form{
            TextField("Title", text: $movie.title)
            
            DatePicker("Release Date:",
                       selection: $movie.releaseDate,
                       displayedComponents: .date)
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if isNew {
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        MovieDetail(SampleData.shared.movie)
    }
}
