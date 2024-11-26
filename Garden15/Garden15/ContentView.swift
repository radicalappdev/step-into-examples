//
//  ContentView.swift
//  Garden15
//
//  Created by Joseph Simpson on 11/26/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        VStack(spacing: 24) {
            Text("🫧")
                .font(.extraLargeTitle2)
            Text("Bubble Garden")
                .font(.title)
            Text("Immersive Spaces")
                .font(.extraLargeTitle)

            ImmersiveSpaceButton(isOpen: appModel.immersiveSpaceOpen, spaceID: "Bubble Garden", value: "Red")
            ImmersiveSpaceButton(isOpen: appModel.immersiveSpaceOpen, spaceID: "Bubble Garden", value: "Blue")
            ImmersiveSpaceButton(isOpen: appModel.immersiveSpaceOpen, spaceID: "Bubble Garden", value: "Green")

        }
        .padding()
    }
}

struct ImmersiveSpaceButton: View {
    let isOpen: Bool
    let spaceID: String
    let value: String

    @Environment(AppModel.self) private var appModel
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some View {
        Button(action: {
            Task {
                if appModel.immersiveSpaceOpen {
                    await dismissImmersiveSpace()
                }
                if !isOpen {
                    await openImmersiveSpace(id: spaceID, value: value)
                }
            }
        }, label: {
            Text(isOpen && value == appModel.immersiveSpaceValue ? "Close \(value) Space" : "Open \(value) Space")
        })
    }
}
