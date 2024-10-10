//
//  ContentView.swift
//  Garden10
//
//  Created by Joseph Simpson on 10/10/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {

        Box(color: .blue)

    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
