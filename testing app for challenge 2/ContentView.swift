//
//  ContentView.swift
//  testing app for challenge 2
//
//  Created by Ashmi Sharma on 8/8/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedExample: AnimationExample?

    var body: some View {
        NavigationStack {
            List(AnimationExample.allCases) { example in
                Button {
                    selectedExample = example
                } label: {
                    HStack {
                        Text(example.title)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(.tertiary)
                    }
                    .contentShape(.rect)
                }
                .buttonStyle(.plain)
            }
            .navigationTitle("Examples")
        }
        .fullScreenCover(item: $selectedExample) { example in
            ExampleCover(example: example)
        }
    }
}

private struct ExampleCover: View {
    @Environment(\.dismiss) private var dismiss

    let example: AnimationExample

    var body: some View {
        NavigationStack {
            example.destination
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle(example.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                }
        }
    }
}

private enum AnimationExample: String, CaseIterable, Identifiable {
    case implicitAnimations
    case explicitAnimations
    case matchedGeometry
    case phaseAnimatorWithoutTrigger
    case phaseAnimatorWithTrigger
    case phaseAnimatorMoreControl
    case phaseAnimatorExampleTwo

    var id: Self { self }

    var title: String {
        switch self {
        case .implicitAnimations: "Implicit Animations"
        case .explicitAnimations: "Explicit Animations"
        case .matchedGeometry: "Matched Geometry Effect"
        case .phaseAnimatorWithoutTrigger: "Phase Animator Without Trigger"
        case .phaseAnimatorWithTrigger: "Phase Animator With Trigger"
        case .phaseAnimatorMoreControl: "Phase Animator With More Control"
        case .phaseAnimatorExampleTwo: "Phase Animator Example 2"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .implicitAnimations:
            implicitanimations()
        case .explicitAnimations:
            explicitanimations()
        case .matchedGeometry:
            matchedGeometryEffect()
        case .phaseAnimatorWithoutTrigger:
            phaseAnimatorWITHOUTTRIGGER()
        case .phaseAnimatorWithTrigger:
            phaseAnimatorWITHTRIGGER()
        case .phaseAnimatorMoreControl:
            phaseAnimatorWithMoreControl()
        case .phaseAnimatorExampleTwo:
            phaseAnimatorsExample2()
        }
    }
}

#Preview {
    ContentView()
}
