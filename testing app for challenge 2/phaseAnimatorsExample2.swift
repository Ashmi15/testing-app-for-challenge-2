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
        case .moveDown: return 20
        case .settle: return 0
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .initial: return 1.0
        case .moveUp: return 1.2
        case .moveDown: return 0.9
        case .settle: return 1.0
        }
    }
}

struct phaseAnimatorsExample2: View {
    @State private var trigger = false
    var body: some View {
        VStack {
            PhaseAnimator(BouncePhase.allCases, trigger: trigger) { phase in Image(systemName: "heart.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.red.gradient)
                    .offset(y: phase.yOffset)
                    .scaleEffect(phase.scale)
            } animation: { phase in
                switch phase {
                case .initial: .spring(duration: 0.3)
                case .moveUp: .spring(duration: 0.25, bounce: 0.4)
                case .moveDown: .spring(duration: 0.2)
                case .settle: .spring(duration: 0.35)
                }
            }
            
            Button("Bounce") { trigger.toggle() }
                .buttonStyle(.borderedProminent)
                .padding(.top, 40)
        }
    }
    //another slightly more complex example with phaseAnimation
}

#Preview {
    phaseAnimatorsExample2()
}
