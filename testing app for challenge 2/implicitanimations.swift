//
//  implicitanimations.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 15/8/26.
//

import SwiftUI

struct implicitanimations: View {
    @State private var scale = 1.0
    var body: some View {
        Button("Tap me") {
            scale += 1
        } .animation(.easeInOut(duration: 0.5), value: scale)
        .scaleEffect(scale)
        .animation(.bouncy(duration: 0.5), value: scale)
        Button("Reset") {
            scale -= 1
            if scale <= 0 {
                scale = 1
            }
        }
        .offset(x: 0, y: 350)

    }
}
// showcase without and with the animation step, show how it adds movement
// showcase the separate modifiers for animations (.easeIn, easeOut, .easeInOut, .smooth, .snappy, .bouncy, .timingCurve
#Preview {
    implicitanimations()
}
