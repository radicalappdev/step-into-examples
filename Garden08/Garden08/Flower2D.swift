//
//  Flower2D.swift
//  Garden08
//
//  Created by Joseph Simpson on 10/2/24.
//

import SwiftUI

struct Flower2D: View {

    @State var flowerEmoji: String = "🌸"

    var body: some View {
        Text(flowerEmoji)
            .font(.system(size: 96))
            .padding()
            .glassBackgroundEffect()
            .clipShape(.rect(cornerRadius: 24))

    }

}

#Preview {
    Flower2D()
}
