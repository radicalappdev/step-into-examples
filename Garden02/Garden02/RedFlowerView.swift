//
//  RedFlowerView.swift
//  Garden02
//
//  Created by Joseph Simpson on 7/29/24.
//

import SwiftUI

struct RedFlowerView: View {
    @Environment(\.dismissWindow) var dismissWindow

    @State private var widthValue: CGFloat = 600
    @State private var heightValue: CGFloat = 400
    @State private var toggle: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Red Flower 🌺")
                .font(.extraLargeTitle2)

            Button(action: {
                dismissWindow(id: "RedFlower")
            }, label: {
                Label("Close Window", systemImage: "xmark.circle")
            })
        }
        .padding()
        .frame(width: widthValue, height: heightValue)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                toggle.toggle()
                withAnimation(.easeInOut(duration: 2.0)) {
                    widthValue = toggle ? 400 : 600
                    heightValue = toggle ? 600 : 400
                }
            }
        }
    }
}

#Preview {
    RedFlowerView()
}
