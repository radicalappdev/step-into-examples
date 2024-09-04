//
//  DetailView.swift
//  Garden04
//
//  Created by Joseph Simpson on 8/7/24.
//

import SwiftUI

struct DetailView: View {

    // We will pass a Flower Item when opening a window
    @Binding var item: FlowerItem?

    var body: some View {
        if let item = item {
            // Get the flower from the item and lay out 6 copies of it in a circle
            GeometryReader { geometry in
                let radius = min(geometry.size.width, geometry.size.height) / 4
                let centerX = geometry.size.width / 2
                let centerY = geometry.size.height / 2
                let flowers = Array(repeating: item.flower, count: 6)

                ForEach(0..<6) { index in
                    let angle = Angle.degrees(Double(index) / Double(flowers.count) * 360)
                    let xOffset = radius * cos(angle.radians)
                    let yOffset = radius * sin(angle.radians)

                    Text(flowers[index])
                        .font(.extraLargeTitle2)
                        .position(x: centerX + xOffset, y: centerY + yOffset)
                }
            }

        } else {
            Text("No Flowers Found!")
                .font(.title)
                .padding()
        }
    }
}
