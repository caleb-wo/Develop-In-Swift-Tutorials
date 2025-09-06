//
//  ContentView.swift
//  MyselfinSixWords
//
//  Created by Caleb Wolfe on 9/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Me In")
                .underline()
            Text("Six Words")
                .underline()
                .padding()

            HStack(spacing: 15){
                Text("Kind")
                    .padding()
                    .background(Color.red,
                                in :RoundedRectangle(cornerRadius: 8))
                Text("Courageous")
                    .padding()
                    .background(Color.orange,
                                in :RoundedRectangle(cornerRadius: 8))
                Text("Care-free")
                    .padding()
                    .background(Color.yellow,
                                in :RoundedRectangle(cornerRadius: 8))
            }
            
            HStack(spacing: 15){
                Text("Faithfull")
                    .padding()
                    .background(Color.green,
                                in :RoundedRectangle(cornerRadius: 8))
                Text("Optomistic")
                    .padding()
                    .background(Color.blue,
                                in :RoundedRectangle(cornerRadius: 8))
                Text("Analytical")
                    .padding()
                    .background(Color.purple,
                                in :RoundedRectangle(cornerRadius: 8))
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
