//
//  phaseAnimatorWITHTRIGGER.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 8/8/26.
//

import SwiftUI
enum AnimationPhase: CaseIterable {
    case start, middle, end
}
struct phaseAnimatorWITHTRIGGER: View {
    @State private var animationStep = 0
    var body: some View {
        Button("Tap me!") {
            animationStep += 1
        }
        .font(.largeTitle)
        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in content
                .blur(radius: phase == .start ? 0:10)
                .scaleEffect(phase == .middle ? 3:1)
        }
    }
}

#Preview {
    phaseAnimatorWITHTRIGGER()
}
