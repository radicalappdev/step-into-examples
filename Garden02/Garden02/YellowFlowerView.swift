//
//  YellowFlowerView.swift
//  Garden02
//
//  Created by Joseph Simpson on 7/29/24.
//

import SwiftUI

struct YellowFlowerView: View {

    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        VStack(spacing: 24) {

            Text("Yellow Flower 🌼")
                .font(.extraLargeTitle2)

            Text("This window group specfied a new default size.")
            Text("`.defaultSize(CGSize(width: 600, height: 600))`")

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
