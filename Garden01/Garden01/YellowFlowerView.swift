//
//  WindowContent01.swift
//  Garden01
//
//  Created by Joseph Simpson on 7/28/24.
//

import SwiftUI

struct YellowFlowerView: View {

    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        VStack(spacing: 24) {
            
            Text("Yellow Flower 🌼")
                .font(.extraLargeTitle2)

            Text("A window with an id value of `YellowFlower`")

            Button(action: {
                dismissWindow(id: "YellowFlower")
            }, label: {
                Label("Close Window", systemImage: "xmark.circle")
            })

        }
        .padding()
    }
}

#Preview {
    YellowFlowerView()
}
