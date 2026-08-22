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
		.font(.title.weight(.medium))
		.phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
			content
				.scaleEffect(phase == .middle ? 1.5 : 1)
				.rotationEffect(.degrees(phase == .middle ? 8 : 0))
				.foregroundStyle(phase == .middle ? .blue : .primary)
			} animation: { phase in
				switch phase {
				case .start:
					.easeOut(duration: 0.25)
				case .middle:
					.spring(duration: 0.4, bounce: 0.6)
				case .end:
					.easeInOut(duration: 0.3)
				}
			}
	}
}

#Preview {
	phaseAnimatorWITHTRIGGER()
}
