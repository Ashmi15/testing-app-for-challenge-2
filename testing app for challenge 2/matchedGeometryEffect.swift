//
//  matchedGeometryEffect.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 15/8/26.
//

import SwiftUI

struct matchedGeometryEffect: View {
    @Namespace private var animation
    @State private var isFlipped = true
    
    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
                Text("TS - Red")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
            } else {
                Text("TS - 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                Circle()
                    .fill(.blue)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
            }
        }
        .onTapGesture {
            withAnimation(.bouncy(duration: 2.0)) {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    matchedGeometryEffect()
}
