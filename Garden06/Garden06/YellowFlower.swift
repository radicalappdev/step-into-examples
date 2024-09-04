//
//  YellowFlower.swift
//  Garden06
//
//  Created by Joseph Simpson on 8/15/24.
//

import SwiftUI

struct YellowFlower: View {
    @Environment(AppModel.self) private var appModel

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack(spacing: 24) {
            Text("Yellow Flower 🌼")
                .font(.extraLargeTitle2)

            WindowController()

            Text("🌼🌼🌼🌼🌼")
                .padding()

        }
        .padding()
        // Make sure to use `initial: true` to report the phase when the window opens
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .inactive, .background:
                appModel.yellowFlowerOpen = false
            case .active:
                appModel.yellowFlowerOpen = true
            @unknown default:
                appModel.yellowFlowerOpen = false
            }
        }
    }
}

#Preview {
    YellowFlower()
}
