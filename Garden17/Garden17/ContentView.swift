//
//  ContentView.swift
//  Garden17
//
//  Created by Joseph Simpson on 12/4/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack {
            Text("❄️")
                .font(.extraLargeTitle2)
            Text("Snow Garden")
                .font(.title)
            Text("Immersive Spaces")
                .font(.extraLargeTitle)

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
