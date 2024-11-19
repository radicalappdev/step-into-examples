//
//  ContentView.swift
//  Garden12
//
//  Created by Joseph Simpson on 11/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack(spacing: 24) {

            Text("🌸")
                .font(.extraLargeTitle2)
            Text("Window Garden")
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
