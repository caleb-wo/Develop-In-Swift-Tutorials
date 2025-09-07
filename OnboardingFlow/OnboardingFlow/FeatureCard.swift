//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by Caleb Wolfe on 9/6/25.
//

import SwiftUI

struct FeatureCard: View {
    let iconName :String
    let description :String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            Text(description)
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.25)
                .brightness(-0.6)
        }
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                description: "This is a description. It should be a multilined summary of a feature.")
}
