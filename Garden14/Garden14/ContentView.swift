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
                    if(appModel.gardenOpen) {
                        await dismissImmersiveSpace()
                        return
                    } else if (!appModel.gardenOpen) {
                        await openImmersiveSpace(id: "GardenSceneMixed")
                    }
                }
            }, label: {
                Text(appModel.gardenOpen ? "Close Mixed Space" :"Open Mixed Space")
            })

            Button(action: {
                Task {
                    if(appModel.gardenOpen) {
                        await dismissImmersiveSpace()
                        return
                    } else if (!appModel.gardenOpen) {
                        await openImmersiveSpace(id: "GardenSceneProgressive")
                    }
                }
            }, label: {
                Text(appModel.gardenOpen ? "Close Progressive Space" :"Open Progressive Space")
            })

            Button(action: {
                Task {
                    if(appModel.gardenOpen) {
                        await dismissImmersiveSpace()
                        return
                    } else if (!appModel.gardenOpen) {
                        await openImmersiveSpace(id: "GardenSceneFull")
                    }
                }
            }, label: {
                Text(appModel.gardenOpen ? "Close Full Space" :"Open Full Space")
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
