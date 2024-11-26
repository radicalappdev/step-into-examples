//
//  ImmersiveView.swift
//  Garden15
//
//  Created by Joseph Simpson on 11/26/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    @Environment(AppModel.self) private var appModel
    @Environment(\.openWindow) private var openWindow

    @State var handTrackedEntity: Entity = {
        let handAnchor = AnchorEntity(.hand(.left, location: .aboveHand))
        return handAnchor
    }()

    var body: some View {
        RealityView { content, attachments in
            if let root = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(root)

                if let glassSphere = root.findEntity(named: "GlassSphere") {
                    glassSphere.components[HoverEffectComponent.self] = .init()
                    createClones(root, glassSphere: glassSphere)
                }

                content.add(handTrackedEntity)
                if let attachmentEntity = attachments.entity(for: "AttachmentContent") {
                    attachmentEntity.components[BillboardComponent.self] = .init()
                    handTrackedEntity.addChild(attachmentEntity)
                }
            }
        } update: { content, attachments in
        } attachments: {
            Attachment(id: "AttachmentContent") {
                HStack(spacing: 12) {
                    Button(action: {
                        openWindow(id: "MainWindow")
                    }, label: {
                        Image(systemName: "arrow.2.circlepath.circle")
                    })

                }
                .opacity(appModel.mainWindowOpen ? 0 : 1)
            }
        }
        .gesture(tap)
    }

    var tap: some Gesture {
        TapGesture()
            .targetedToAnyEntity()
            .onEnded { value in
                value.entity.removeFromParent()
            }
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

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
