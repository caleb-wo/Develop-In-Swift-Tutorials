//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Caleb Wolfe on 9/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names :[String] = [
        "Caleb",
        "Mary",
        "Matthew",
        "Ethan",
    ]
    @State private var nameToAdd = ""
    
    var body: some View {
        VStack {
            List{
                
                ForEach( names,
                         id: \.description
                ){ name in
                    Text(name)
                }
                
                TextField("Add name", text: $nameToAdd)
                    .autocorrectionDisabled()
                    .onSubmit{
                        if nameToAdd != ""{
                            names.append(nameToAdd)
                            nameToAdd = ""
                        }
                    }
                
            } // List
        } // VStack
        .padding()
    }
}

#Preview {
    ContentView()
}
