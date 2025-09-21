//
//  ContentView.swift
//  Birthdays
//
//  Created by Caleb Wolfe on 9/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var newName = ""
    @State private var newDate = Date.now
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Text("Birthdays")
            .font(.title)
            .bold()
        NavigationStack{
            List(friends) { friend in
                HStack{
                    if friend.isBirthdayToday{
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
        }
        .navigationTitle("Birthdays")
        .safeAreaInset(edge: .bottom){
            VStack(alignment: .center, spacing: 20){
                Text("New Birthday")
                    .font(.headline)
                
                DatePicker(selection: $newDate,
                           in: Date.distantPast...Date.now,
                           displayedComponents: .date) {
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button("Save") {
                    var newFriend = Friend(name: newName, birthday: newDate)
                    context.insert(newFriend)
                    
                    newName = ""
                    newDate = .now
                }
                .bold()
            }
            .padding()
            .background(.bar)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
