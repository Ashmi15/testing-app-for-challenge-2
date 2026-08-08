//
//  phaseAnimatorWITHOUTTRIGGER.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 8/8/26.
//

import SwiftUI

// need an enum here called AnimationPhase: CaseIterable and declare 3 cases start, middle, and end
struct phaseAnimatorWITHOUTTRIGGER: View {
    //add state variable here called animationStep
    var body: some View {
        Text("Tap me!") // change to button in with trigger
            .font(.largeTitle)
            .foregroundStyle(.blue) //no longer need this
            .phaseAnimator([0, 1, 3]) { view, phase in view
                    .scaleEffect(phase)
                    .opacity(phase == 1 ? 1 : 0)
                
            // instead for withtrigger do .phaseAnimator(AnimationPhase.allCases, triggerL animationStep) { content, phase in content
                    //.blur(radius: phase ==.start ? 0:10)
                    //.scaleEffect(phase == .middle ? 3:1)
            }
        }
    }

#Preview {
    phaseAnimatorWITHOUTTRIGGER()
}
