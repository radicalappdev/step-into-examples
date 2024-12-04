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

    @Environment(AppModel.self) private var appModel
    @State var immersionAmount: Float = 0

    var speed: Float = 1
    var birthRate: Float = 3000

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
            snowEntity.name = "Snow"
            snowEntity.components.set(snowParticles)
            content.add(snowEntity)


        } update: { content in
            if let snow = content.entities.first(where: { $0.name == "Snow" }){
                // Get the particle component
                if var snowParticles = snow.components[ParticleEmitterComponent.self] {

                    // Adjust the speed and birthrate using the immersion amount
                    snowParticles.speed = speed * immersionAmount
                    snowParticles.mainEmitter.birthRate = birthRate * immersionAmount


                    // Reassign the component to the entity
                    snow.components.set(snowParticles)
                }
            }
        }
        .onImmersionChange { inintial, new in
            immersionAmount = Float(new.amount ?? 0)
        }
    }
}

#Preview(immersionStyle: .progressive) {
    ImmersiveView()
        .environment(AppModel())
}
