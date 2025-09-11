//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Caleb Wolfe on 9/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names :[String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    @State private var showSameNameAlert = false

    var body: some View {
        VStack{
            VStack(spacing: 10){
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .font(.title2)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
                    .font(.title)
            }
            
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title3)
                .bold()
                .padding(.vertical, 10)
                .foregroundStyle(.tint)
            
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
                            if names.contains(nameToAdd){
                                showSameNameAlert = true
                                nameToAdd = ""
                            } else {
                                names.append(nameToAdd)
                                nameToAdd = ""
                            }
                        }
                    }
                
            } // List
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .alert("Duplicated name", isPresented: $showSameNameAlert){
            } message: {
                Text("Try adding initials.")
            }
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            Button{
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    
                    if shouldRemovePickedName{
                        names.removeAll{ name in
                            name == randomName
                        }
                    }
                    
                } else{
                    pickedName = ""
                }
            } label:{
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        } // VStack
        .padding()
    }
}

#Preview {
    ContentView()
}
