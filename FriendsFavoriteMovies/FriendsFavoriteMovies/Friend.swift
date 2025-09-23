//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/22/25.
//

import Foundation
import SwiftData

@Model
class Friend{
    var name: String
    
    init( name: String ){
        self.name = name
    }
}
