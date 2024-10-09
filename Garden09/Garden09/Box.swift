//
//  Box.swift
//  Garden09
//
//  Created by Joseph Simpson on 10/9/24.
//

import SwiftUI
import RealityKit

struct Box: View {
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateBox(size: 0.8, cornerRadius: 0),
                materials: [SimpleMaterial(color: .systemBlue, isMetallic: false)])
            content.add(model)
        }
    }
}

#Preview {
    Box()
}
