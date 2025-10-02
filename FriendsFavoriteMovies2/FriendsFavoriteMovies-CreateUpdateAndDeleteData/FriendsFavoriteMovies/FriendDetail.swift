//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Caleb Wolfe on 9/28/25.
//

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: Friend
    @Environment(\.dismiss) private var dismiss
    let isNew: Bool
    
    init(_ friend: Friend, isNew: Bool = false){
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
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
        FriendDetail(SampleData.shared.friend)
    }
}
