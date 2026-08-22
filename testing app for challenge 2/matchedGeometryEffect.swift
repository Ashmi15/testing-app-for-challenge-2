//
//  matchedGeometryEffect.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 15/8/26.
//

import SwiftUI

struct matchedGeometryEffect: View {
	@Namespace private var animation
	@State private var isFlipped = false

	var body: some View {
		VStack(spacing: 30) {
			
			if !isFlipped {
				Circle()
					.fill(.red)
					.frame(width: 60, height: 60)
					.matchedGeometryEffect(id: "circle", in: animation)

				Text("red")
					.font(.headline)
					.frame(width: 50)
					.matchedGeometryEffect(id: "title", in: animation)

				Spacer()
			} else {
				Spacer()

				Text("blue")
					.font(.headline)
					.frame(width: 50)
					.matchedGeometryEffect(id: "title", in: animation)

				Circle()
					.fill(.blue)
					.frame(width: 60, height: 60)
					.matchedGeometryEffect(id: "circle", in: animation)
			}
			}
		.frame(height: 300)
		.padding()
		.onTapGesture {
			withAnimation(.bouncy(duration: 0.8)) {
				isFlipped.toggle()
			}
		}
	}
}

#Preview {
	matchedGeometryEffect()
}
