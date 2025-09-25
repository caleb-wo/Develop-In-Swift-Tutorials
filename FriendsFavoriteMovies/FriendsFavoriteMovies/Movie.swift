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
}
