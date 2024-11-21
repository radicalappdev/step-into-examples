//
//  ContentView.swift
//  Garden13
//
//  Created by Joseph Simpson on 11/21/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(AppModel.self) private var appModel

    @State var isImmersiveSpacePresented: Bool = false

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

            Button(action: {
                Task {
                    await openImmersiveSpace(id: "GardenScene")
                    isImmersiveSpacePresented = true
                }
            }, label: {
                Text("Open Immersive Space")
            })
            .disabled(isImmersiveSpacePresented)

            Button(action: {
                Task {
                    await dismissImmersiveSpace()
                    isImmersiveSpacePresented = false
                }
            }, label: {
                Text("Close Immersive Space")
            })
            .disabled(!isImmersiveSpacePresented)
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

#Preview(windowStyle: .automatic) {
    ContentView()

}
