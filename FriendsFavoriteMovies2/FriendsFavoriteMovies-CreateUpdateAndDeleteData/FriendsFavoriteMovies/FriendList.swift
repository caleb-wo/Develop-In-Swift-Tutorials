import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        FriendDetail(friend: friend)
                    }
                }
                .onDelete(perform: deleteFriend(indexes:))
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem {
                    Button("Add Friend", systemImage: "plus",
                                         action: addFriend)
                }
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addFriend(){
        context.insert(Friend(name: "New Friend!"))
    }
    
    private func deleteFriend(indexes: IndexSet){
        for i in indexes{
            context.delete(friends[i])
        }
    }
    
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
