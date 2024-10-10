//
//  SplashScreen.swift
//  Garden10
//
//  Created by Joseph Simpson on 10/10/24.
//

import SwiftUI

struct SplashScreen: View {
    @Environment(\.pushWindow) private var pushWindow
    @Environment(\.dismissWindow) private var dismissWindow

    @State private var isSpinning = false

    var body: some View {
        ZStack {
            Box(color: .stepRed)
                .ornament(attachmentAnchor: .scene(.front), ornament: {
                    Text("🌸")
                        .font(.system(size: 100))
                        .rotationEffect(Angle.degrees(isSpinning ? 360 : 0))
                        .animation(Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: false), value: isSpinning)
                        .onAppear {
                            isSpinning = true
                        }
                })
        }
        .onAppear {
            // Delay for opening the main window
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                // Open with main window with a shared id using pushWindow instead of openWindow
                pushWindow(id: "MainWindow")
                
                // Short delay before closing the splash screen
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    dismissWindow(id: "SplashScreen")
                    
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
