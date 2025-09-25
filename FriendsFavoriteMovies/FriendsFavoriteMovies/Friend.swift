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
    
    static let sampleData: [Friend] = [
        Friend(name: "Caleb"),
        Friend(name: "Mary"),
        Friend(name: "Matthew"),
        Friend(name: "Amanda"),
        Friend(name: "Pops"),
        Friend(name: "Mom"),
        Friend(name: "Ethan"),
        Friend(name: "Logan"),]
}
