//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by Caleb Wolfe on 9/6/25.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill",
                        description: "This is a description. It should be a multilined summary of a feature.")

            FeatureCard(iconName: "computermouse.fill",
                        description: "This is a shorter description.")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
}
