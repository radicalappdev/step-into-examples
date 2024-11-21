//
//  ContentView.swift
//  Garden13
//
//  Created by Joseph Simpson on 11/21/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var isImmersiveSpacePresented: Bool = false

    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some View {
        VStack(spacing: 24) {

            Text("🫧")
                .font(.extraLargeTitle2)
            Text("Bubble Garden")
                .font(.title)
            Text("Immersive Spaces")
                .font(.extraLargeTitle)

            Button(action: {
                Task {
                    await openImmersiveSpace(id: "GardenScene")
                    isImmersiveSpacePresented = true
                }
            }, label: {
                Text("Open Immersive Space")
            })
            .disabled(isImmersiveSpacePresented)

            Button(action: {
                Task {
                    await dismissImmersiveSpace()
                    isImmersiveSpacePresented = false
                }
            }, label: {
                Text("Close Immersive Space")
            })
            .disabled(!isImmersiveSpacePresented)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()

}
