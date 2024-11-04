//
//  ContentView.swift
//  Garden11
//
//  Created by Joseph Simpson on 11/4/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var showBasePlate = true

    var body: some View {
        RealityView { content in
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



        } update: { content in
        }
        .toolbar() {
            ToolbarItem(placement: .bottomOrnament, content: {
                Button(action: {
                    showBasePlate.toggle()
                }, label: {
                    Image(systemName: showBasePlate ? "rectangle" : "rectangle.slash" )
                    Text("Toggle Baseplate")
                })
            })
        }
        .volumeBaseplateVisibility(showBasePlate ? .visible : .hidden)

    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
