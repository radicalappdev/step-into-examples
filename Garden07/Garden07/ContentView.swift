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

    @State private var enlarge = false

    var body: some View {
        RealityView { content, attachments in

            // Create a material for the ground
            var groundMat = PhysicallyBasedMaterial()
            groundMat.baseColor.tint = .init(.green)
            groundMat.roughness = 0.0
            groundMat.metallic = 0.0

            // Create the ground as a simple box
            let groundModel = ModelEntity(
                mesh: .generateBox(size: 1, cornerRadius: 0.1),
                materials: [groundMat])
            groundModel.scale = .init(x: 0.95, y: 0.1, z: 0.95)
            groundModel.position = .init(x: 0, y: -0.4, z: 0)
            content.add(groundModel)

            if let attachmentEntity = attachments.entity(for: "🌸") {
                attachmentEntity.position = [0, -0.25, 0]
                content.add(attachmentEntity)
            }

        } update: { content, attachments in
            // Update the RealityKit content when SwiftUI state changes

        } attachments: {
            Attachment(id: "🌸") {
                Flower2D(flowerEmoji: "🌸")
            }
        }


    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
