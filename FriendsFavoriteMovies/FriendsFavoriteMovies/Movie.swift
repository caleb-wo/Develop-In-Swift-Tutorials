//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/22/25.
//

import Foundation
import SwiftData

@Model
class Movie{
    var title: String
    var releaseDate: Date
    
    init( title: String, releaseDate: Date){
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "Amusing Space Traveler 3",
              releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Epic Movie",
              releaseDate: Date(timeIntervalSinceReferenceDate: -40_000_000)),
        Movie(title: "Terminator",
              releaseDate: Date(timeIntervalSinceReferenceDate: -302_000_000)),
        Movie(title: "Shrek Versus Godzilla",
              releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Trash Movie",
              releaseDate: Date(timeIntervalSinceReferenceDate: -82_000_000)),
    ]
}
