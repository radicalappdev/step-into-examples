//
//  ContentView.swift
//  Garden08
//
//  Created by Joseph Simpson on 10/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(FlowerData.self) private var flowerData

    var body: some View {
        VStack(spacing: 24) {
            Text("Window Garden 🌸")
                .font(.extraLargeTitle2)

            List(flowerData.items) { item in
                HStack {
                    Button(action: {
                        openWindow(id: "FlowerVolume", value: item)
                    }, label: {
                        HStack {
                            Text(item.flower)
                            Text(item.name)
                        }
                        .font(.largeTitle)
                    })
                }
            }
        }
        .padding()
    }
}



