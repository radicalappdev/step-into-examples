//
//  ContentView.swift
//  Garden07
//
//  Created by Joseph Simpson on 9/30/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        RealityView { content, attachments in
            // Set up the main content for the RealityView

            // Create a material for the ground
            var groundMat = PhysicallyBasedMaterial()
            groundMat.baseColor.tint = .init(.green)
            groundMat.roughness = 0.0
            groundMat.metallic = 0.0

            // Create the ground as a simple box
            let groundModel = ModelEntity(
                mesh: .generateBox(size: 1, cornerRadius: 0.1),
                materials: [groundMat])
            groundModel.scale = .init(x: 0.8, y: 0.025, z: 0.8)
            groundModel.position = .init(x: 0, y: -0.44, z: 0)
            content.add(groundModel)

            if let flower01 = attachments.entity(for: "🌸") {
                flower01.position = [0, -0.25, 0]
                content.add(flower01)

            }

        } update: { content, attachments in
            // Update the RealityKit content when SwiftUI state changes

        } attachments: {
            // Pass in ant SwiftUI views as attachments
            Attachment(id: "🌸") {
                Flower2D(flowerEmoji: "🌸")
                    .onTapGesture {
                        openWindow(id: "🌸")
                    }
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
