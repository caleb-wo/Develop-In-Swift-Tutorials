//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/24/25.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List{
            ForEach(friends){ friend in
                Text(friend.name)
            }
        }
        .task{
            context.insert(Friend(name: "Jason"))
            context.insert(Friend(name: "Kupu"))
            context.insert(Friend(name: "Eli"))
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(for: Friend.self, inMemory: true)
}
