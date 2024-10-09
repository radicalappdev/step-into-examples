//
//  Flower01Scene.swift
//  Garden08
//
//  Created by Joseph Simpson on 10/2/24.
//

import SwiftUI

    struct Flower01Scene: View {
        @Environment(\.dismissWindow) var dismissWindow

        @Binding var item: FlowerItem?

        var body: some View {

            if let item = item {
                Flower2D(flowerEmoji: item.flower)
                    .ornament(attachmentAnchor: .scene(.bottomLeadingBack)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.bottomLeadingFront)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.bottomTrailingBack)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.bottomTrailingFront)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.topLeadingBack)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.topLeadingFront)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.topTrailingBack)) {
                        Text(item.flower)
                    }
                    .ornament(attachmentAnchor: .scene(.topTrailingFront)) {
                        Text(item.flower)
                    }

            } else {
                Text("No Flowers Found!")
                    .font(.title)
                    .padding()
            }

        }
    }
