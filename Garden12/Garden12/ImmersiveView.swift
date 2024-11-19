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
        RealityView { content, attachments in

            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                if let glassSphere = immersiveContentEntity.findEntity(named: "GlassSphere") {

                let clone = glassSphere.clone(recursive: true)
                    content.add(clone)
                    clone.position = .init(x: 0.7, y: 1.5, z: -1.5)
                }


            }
        } update: { content, attachments in
        } attachments: {
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
