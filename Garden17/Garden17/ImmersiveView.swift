//
//  ImmersiveView.swift
//  Garden17
//
//  Created by Joseph Simpson on 12/4/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    @State var snow: Entity?

    var body: some View {
        RealityView { content in

            // Create some snow!
            var snowParticles = ParticleEmitterComponent.Presets.snow
            snowParticles.speed = 0.5
            snowParticles.mainEmitter.birthRate = 2000
            snowParticles.emitterShape = .sphere
            snowParticles.emitterShapeSize = [5,5,5]
            snowParticles.mainEmitter.size = 0.01

            let snowEntity = Entity()
            snowEntity.components.set(snowParticles)
            content.add(snowEntity)
            snow = snowEntity // stash this to use later

        }
    }
}

#Preview(immersionStyle: .progressive) {
    ImmersiveView()
        .environment(AppModel())
}
