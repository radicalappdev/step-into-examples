//
//  Garden02App.swift
//  Garden02
//
//  Created by Joseph Simpson on 7/29/24.
//

import SwiftUI

@main
struct Garden02App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        WindowGroup(id: "YellowFlower") {
            YellowFlowerView()
                .frame(minWidth: 500, maxWidth: 700, minHeight: 500, maxHeight: 700)
            // .frame(width: 600, height: 600) // used to set a fized size
        }
        .windowResizability(.contentSize)
        .defaultSize(CGSize(width: 600, height: 600))

        WindowGroup(id: "RedFlower") {
            RedFlowerView()
                // frame moved into the view
        }
        .windowResizability(.contentSize)
        .defaultSize(CGSize(width: 600, height: 600))

    }
}
