//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Caleb Wolfe on 9/6/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            Text("Welcome to My App")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .padding(3)
                .border(.black, width: 3)
            
            Text("Description here. This is the the description of the app.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(3)
                .border(.secondary, width: 3)
        }
        .border(.red, width: 4)
        .padding()
        .border(.red, width: 4)
    }
}

#Preview {
    WelcomePage()
}
