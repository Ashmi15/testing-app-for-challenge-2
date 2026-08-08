//
//  phaseAnimatorWithMoreControl.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 8/8/26.
//

import SwiftUI

struct phaseAnimatorWithMoreControl: View {
    @State private var animationStep = 0
    var body: some View {
        //available in phaseAnimatorWihTrigger
        Button("Tap me!") {
            animationStep += 1
        }
        .font(.largeTitle)
        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in content
                .blur(radius: phase == .start ? 0:10)
                .scaleEffect(phase == .middle ? 3:1)
        //added info below
        } animation: { phase in
            switch phase {
            case .start, .end: .bouncy
            case .middle: .easeInOut(duration: 2)
            }
            }
        }
}

#Preview {
    phaseAnimatorWithMoreControl()
}
