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
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70,
                                  weight: .bold,
                                  design: .rounded))
                
            }
            
            Text("Welcome to My App")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .padding(.top)
                .foregroundStyle(.white)
            
            Text("Description here. This is the the description of the app.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(3)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}
