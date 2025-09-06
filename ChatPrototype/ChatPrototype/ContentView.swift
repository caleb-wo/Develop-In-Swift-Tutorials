//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Caleb Wolfe on 9/3/25.
//

import SwiftUI

struct ContentView :View {
    var body :some View {
        VStack(spacing: 25) {
            
            Text("Knock, knock!")
                .padding()
                .background(Color.yellow,
                            in :RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)

            Text("Who's there?")
                .padding()
                .background(Color.teal,
                            in :RoundedRectangle(cornerRadius: 8))
            
            Text("Owl!")
                .padding()
                .background(Color.green,
                            in : RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)

            Text("'Owl' who?")
                .padding()
                .background(Color.pink,
                            in :RoundedRectangle(cornerRadius: 20))
            
            Text("Yes, owls do 'whooo!'")
                .padding()
                .background(Color.blue,
                            in :RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
