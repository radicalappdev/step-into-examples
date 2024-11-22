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

            Button(action: {
                Task {
                    if(appModel.gardenMixedOpen) {
                        await dismissImmersiveSpace()
                        return
                    } else if (!appModel.gardenMixedOpen) {
                        await openImmersiveSpace(id: "GardenSceneMixed")
                    }
                }
            }, label: {
                Text(appModel.gardenMixedOpen ? "Close Mixed Space" :"Open Mixed Space")
            })

            Button(action: {
                Task {
                    if(appModel.gardenProgressiveOpen) {
                        await dismissImmersiveSpace()
                        return
                    } else if (!appModel.gardenProgressiveOpen) {
                        await openImmersiveSpace(id: "GardenSceneProgressive")
                    }
                }
            }, label: {
                Text(appModel.gardenProgressiveOpen ? "Close Progressive Space" :"Open Progressive Space")
            })

            Button(action: {
                Task {
                    if(appModel.gardenFullOpen) {
                        await dismissImmersiveSpace()
                        return
                    } else if (!appModel.gardenFullOpen) {
                        await openImmersiveSpace(id: "GardenSceneFull")
                    }
                }
            }, label: {
                Text(appModel.gardenFullOpen ? "Close Full Space" :"Open Full Space")
            })



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
