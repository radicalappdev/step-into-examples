//
//  FlowerPicker.swift
//  Garden05
//
//  Created by Joseph Simpson on 8/14/24.
//

import SwiftUI

struct FlowerPicker: View {
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(AppModel.self) private var appModel

    var body: some View {
        HStack {
            Button(action: {
                appModel.selectedFlower = "🌸"
                dismissWindow(id: "FlowerPicker")
            }, label: {
                Text("🌸")
            })
            Button(action: {
                appModel.selectedFlower = "🌼"
                dismissWindow(id: "FlowerPicker")
            }, label: {
                Text("🌼")
            })
            Button(action: {
                appModel.selectedFlower = "🌺"
                dismissWindow(id: "FlowerPicker")
            }, label: {
                Text("🌺")
            })
        }
        .buttonStyle(.plain)
        .font(.system(size: 100))
        .padding()
    }
}

#Preview {
    FlowerPicker()
}
