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
        RealityView { content in

            let model = ModelEntity(
                mesh: .generateBox(size: 1, cornerRadius: 0.1),
                materials: [SimpleMaterial(color: .green, roughness: 0, isMetallic: false)])
            model.scale = .init(x: 0.95, y: 0.1, z: 0.95)
            model.position = .init(x: 0, y: -0.4, z: 0)
            content.add(model)
        } update: { content in
            // Update the RealityKit content when SwiftUI state changes

        }


    }

    struct Flower: View {
        var body: some View {
            Text("🌸")
                .font(.system(size: 72))
                .hoverEffect(ScaleHoverEffect())
        }
    }

    struct ScaleHoverEffect: CustomHoverEffect {
        func body(content: Content) -> some CustomHoverEffect {
            content.hoverEffect { effect, isActive, proxy in
                effect.animation(.easeOut) {
                    $0.scaleEffect(isActive ? CGSize(width: 0.4, height: 0.4) : CGSize(width: 1, height: 1), anchor: .bottom)
                }
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
