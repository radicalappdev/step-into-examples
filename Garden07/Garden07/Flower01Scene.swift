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
    }
}

#Preview {
    Flower01Scene()
}
