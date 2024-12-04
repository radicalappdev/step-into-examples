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
    @State var snow: Entity?
    @State var immersionAmount: Double = 0

    var speed: Double = 0.5
    var birthRate: Double = 2000

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

        } update: { content in
            if let snow {
                if var snowParticles = snow.components[ParticleEmitterComponent.self] {

                    snowParticles.speed = Float(speed * immersionAmount)
                    snowParticles.mainEmitter.birthRate = Float(
                        birthRate * immersionAmount
                    )

                    snow.components.set(snowParticles)
                    print("Snow particles: \(snowParticles)")

                }
            }
        }
        .onImmersionChange { inintial, new in
            immersionAmount = new.amount ?? 0
            print("Immersion amount: \(immersionAmount)")
        }
    }
}

#Preview(immersionStyle: .progressive) {
    ImmersiveView()
        .environment(AppModel())
}
