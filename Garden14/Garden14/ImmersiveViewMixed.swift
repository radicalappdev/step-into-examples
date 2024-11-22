//
//  ImmersiveView.swift
//  Garden14
//
//  Created by Joseph Simpson on 11/22/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveViewMixed: View {

    @Environment(AppModel.self) private var appModel
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        ImmersiveSceneContent()
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .inactive, .background:
                appModel.gardenMixedOpen = false
            case .active:
                appModel.gardenMixedOpen = true
            @unknown default:
                appModel.gardenMixedOpen = false
            }
        }
    }


}
