//
//  Flower01Scene.swift
//  Garden07
//
//  Created by Joseph Simpson on 9/30/24.
//

import SwiftUI

struct Flower01Scene: View {
    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        Flower2D(flowerEmoji: "🌸")
            .onTapGesture {
                dismissWindow(id: "🌸")
            }

            .ornament(attachmentAnchor: .scene(.bottomLeadingBack)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.bottomLeadingFront)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.bottomTrailingBack)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.bottomTrailingFront)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.topLeadingBack)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.topLeadingFront)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.topTrailingBack)) {
                Text("🌸")
            }
            .ornament(attachmentAnchor: .scene(.topTrailingFront)) {
                Text("🌸")
            }

    }
}

#Preview {
    Flower01Scene()
}
