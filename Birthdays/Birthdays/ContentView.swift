//
//  ContentView.swift
//  Birthdays
//
//  Created by Caleb Wolfe on 9/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var newName = ""
    @State private var newDate = Date.now
    @State private var friends: [Friend] = [
        Friend(name: "Doug Smarth", birthday: .now),
        Friend(name: "Margaret Smarth", birthday: Date(timeIntervalSince1970: 0)),
    ]
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in
                HStack{
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
                    friends.append(newFriend)
                    
                    newName = ""
                    newDate = .now
                }
                .bold()
            }
        }
        .padding()
        .background(.bar)
    }
}

#Preview {
    ContentView()
}
