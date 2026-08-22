//
//  phaseAnimatorsExample2.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 15/8/26.
//

import SwiftUI

enum BouncePhase: CaseIterable {
	case initial, moveUp, moveDown, settle
	
	var yOffset: CGFloat {
		switch self {
		case .initial: return 0
		case .moveUp: return -60
		case .moveDown: return 15
		case .settle: return 0
		}
	}
	
	var scale: CGFloat {
		switch self {
		case .initial: return 1.0
		case .moveUp: return 1.15
		case .moveDown: return 0.85
		case .settle: return 1.0
		}
	}
	
	var rotation: Double {
		switch self {
		case .initial: return 0
		case .moveUp: return -8
		case .moveDown: return 5
		case .settle: return 0
		}
	}
}

struct phaseAnimatorsExample2: View {
	@State private var trigger = false
	
	var body: some View {
		VStack {
			PhaseAnimator(BouncePhase.allCases, trigger: trigger) { phase in
				Image(systemName: "heart.fill")
					.font(.system(size: 60))
					.foregroundStyle(.red.gradient)
					.offset(y: phase.yOffset)
					.scaleEffect(phase.scale)
					.rotationEffect(.degrees(phase.rotation))
			} animation: { phase in
				switch phase {
				case .initial:
					.spring(duration: 0.3)
				case .moveUp:
					.spring(duration: 0.3, bounce: 0.5)
				case .moveDown:
					.spring(duration: 0.2, bounce: 0.3)
				case .settle:
					.spring(duration: 0.4, bounce: 0.6)
				}
			}
			
			Button("Bounce") {
				trigger.toggle()
			}
			.buttonStyle(.glass)
			.padding(.top, 40)
		}
	}
}

// Another slightly more complex example with PhaseAnimator

#Preview {
	phaseAnimatorsExample2()
}
