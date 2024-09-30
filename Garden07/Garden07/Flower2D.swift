//
//  Flower2D.swift
//  Garden07
//
//  Created by Joseph Simpson on 9/30/24.
//

import SwiftUI

struct Flower2D: View {
    @State var flowerEmoji: String = "🌸"

    var body: some View {
        Text(flowerEmoji)
            .font(.system(size: 96))
            .hoverEffect(ScaleHoverEffect())

    }
    struct ScaleHoverEffect: CustomHoverEffect {
        func body(content: Content) -> some CustomHoverEffect {
            content.hoverEffect { effect, isActive, proxy in
                effect.animation(.easeOut) {
                    $0.scaleEffect(isActive ? CGSize(width: 0.8, height: 0.8) : CGSize(width: 1, height: 1), anchor: .bottom)
                }
            }
        }
    }
}

#Preview {
    Flower2D()
}
