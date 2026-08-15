//
//  explicitanimations.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 15/8/26.
//

import SwiftUI

struct explicitanimations: View {
    @State private var isExpanded = false
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: isExpanded ? 20 : 50)
                .fill(.purple.gradient)
                .frame(
                    width: isExpanded ? 300 : 100,
                    height: isExpanded ? 200: 100
        )
                .rotationEffect(.degrees(rotation))
        
            Button("Toggle") {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isExpanded.toggle()
                }
                //This change is NOT animated
                rotation += 45
            }
            .offset(x: 0, y: 245)
        }
    }
}
// use withAnimation{} when you need more control over what gets animated, as it simply just wraps a state change in an animation context, giving one precise control + shld be used when we want some state changes animated and others not
// with this code, only the state change for the @state var isExpanded is animated, not rotation
#Preview {
    explicitanimations()
}
