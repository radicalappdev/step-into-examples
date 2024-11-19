//
//  ImmersiveView.swift
//  Garden12
//
//  Created by Joseph Simpson on 11/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let root = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(root)

                if let glassSphere = root.findEntity(named: "GlassSphere") {
                    createClones(root, glassSphere: glassSphere)
                }
            }
        }
        .preferredSurroundingsEffect(.colorMultiply(.pink))
    }

    func createClones(_ root: Entity, glassSphere: Entity) {
        let centerPos = SIMD3<Float>(0, 1.5, 0)
        for _ in 1...100 {
            let clone = glassSphere.clone(recursive: true)
            // Random spherical coordinates - thanks ChatGPT!
            let distance = Float.random(in: 1...3) // Radius between 1 and 3
            let theta = Float.random(in: 0...(2 * .pi)) // Random angle for the horizontal plane
            let phi = Float.random(in: 0...(Float.pi)) // Random angle for the vertical plane

            // Convert spherical coordinates to Cartesian
            let x = distance * sin(phi) * cos(theta)
            let y = distance * sin(phi) * sin(theta)
            let z = distance * cos(phi)
            clone.position = centerPos + SIMD3(x, y, z)
            root.addChild(clone)
        }
    }
}
