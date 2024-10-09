//
//  VolumeExample.swift
//  Garden09
//
//  Created by Joseph Simpson on 10/9/24.
//

import SwiftUI

struct VolumeExample: View {

    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    @State var isOpened: Bool = false

    var body: some View {
        Box()
            .ornament(attachmentAnchor: .scene(.bottomFront), ornament: {
                VStack(spacing: 24) {
                    Text("Default Placement with Volumes")
                        .multilineTextAlignment(.center)
                        .font(.extraLargeTitle2)

                    Button(action: {
                        if(isOpened) {
                            dismissWindow(id: "VolumeLeading")
                            dismissWindow(id: "VolumeTrailing")
                            dismissWindow(id: "VolumeBelow")
                            dismissWindow(id: "VolumeAbove")
                            isOpened.toggle()
                        } else {
                            openWindow(id: "VolumeLeading")
                            openWindow(id: "VolumeTrailing")
                            openWindow(id: "VolumeBelow")
                            openWindow(id: "VolumeAbove")
                            isOpened.toggle()
                        }
                    }, label: {
                        Label(isOpened ? "Close Volumes" :"Open Volumes", systemImage: "cube.fill")
                    })
                }
                .padding()

            })
    }
}

#Preview {
    VolumeExample()
}
