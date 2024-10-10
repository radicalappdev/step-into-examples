//
//  Box.swift
//  Garden10
//
//  Created by Joseph Simpson on 10/10/24.
//

import SwiftUI
import RealityKit

struct Box: View {
    var color: UIColor = .black
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateBox(size: 0.8, cornerRadius: 0),
                materials: [SimpleMaterial(color: color, isMetallic: false)])
            content.add(model)
        }
    }
}

#Preview {
    Box()
}
