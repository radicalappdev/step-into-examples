//
//  ContentView.swift
//  Garden14
//
//  Created by Joseph Simpson on 11/22/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(AppModel.self) private var appModel

    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack(spacing: 24) {

            Text("🫧")
                .font(.extraLargeTitle2)
            Text("Bubble Garden")
                .font(.title)
            Text("Immersive Spaces")
                .font(.extraLargeTitle)

            ImmersiveSpaceButton(
                isOpen: appModel.gardenMixedOpen,
                spaceID: "GardenSceneMixed",
                label: "Mixed"
            )
            ImmersiveSpaceButton(
                isOpen: appModel.gardenProgressiveOpen,
                spaceID: "GardenSceneProgressive",
                label: "Progressive"
            )
            ImmersiveSpaceButton(
                isOpen: appModel.gardenFullOpen,
                spaceID: "GardenSceneFull",
                label: "Full"
            )
        }
        .padding()
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .inactive, .background:
                appModel.mainWindowOpen = false
            case .active:
                appModel.mainWindowOpen = true
            @unknown default:
                appModel.mainWindowOpen = false
            }
        }
    }
}

struct ImmersiveSpaceButton: View {
    let isOpen: Bool
    let spaceID: String
    let label: String

    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some View {
        Button(action: {
            Task {
                if isOpen {
                    await dismissImmersiveSpace()
                } else {
                    await openImmersiveSpace(id: spaceID)
                }
            }
        }, label: {
            Text(isOpen ? "Close \(label) Space" : "Open \(label) Space")
        })
    }
}
