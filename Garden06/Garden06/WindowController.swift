//
//  WindowController.swift
//  Garden06
//
//  Created by Joseph Simpson on 8/15/24.
//

import SwiftUI

struct WindowController: View {
    @Environment(AppModel.self) private var appModel
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    var body: some View {
        List {
            Button(action: {
                if appModel.mainWindowOpen {
                    dismissWindow(id: "MainWindow")
                } else {
                    openWindow(id: "MainWindow")
                }

            }, label: {
                HStack {
                    Text("Main Window")
                    Spacer()
                    Text(appModel.mainWindowOpen ? "Open" : "Closed")
                }
            })
            Button(action: {
                if appModel.yellowFlowerOpen {
                    dismissWindow(id: "YellowFlower")
                } else {
                    openWindow(id: "YellowFlower")
                }

            }, label: {
                HStack {
                    Text("Yellow Flower")
                    Spacer()
                    Text(appModel.yellowFlowerOpen ? "Open" : "Closed")
                }
            })
        }
    }
}

#Preview {
    WindowController()
}
