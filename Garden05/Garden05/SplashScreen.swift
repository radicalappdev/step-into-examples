//
//  SplashScreen.swift
//  Garden05
//
//  Created by Joseph Simpson on 8/14/24.
//

import SwiftUI

struct SplashScreen: View {
    @Environment(\.pushWindow) private var pushWindow
    @Environment(\.dismissWindow) private var dismissWindow

    @State private var isSpinning = false

    var body: some View {
        ZStack {
            MeshGradient(
                width: 3,
                height: 3,
                locations: .points([
                    SIMD2<Float>(0.000, 0.000),
                    SIMD2<Float>(0.120, 0.000),
                    SIMD2<Float>(1.000, 0.000),
                    SIMD2<Float>(0.000, 0.350),
                    SIMD2<Float>(0.700, 0.800),
                    SIMD2<Float>(1.000, 0.650),
                    SIMD2<Float>(0.000, 1.000),
                    SIMD2<Float>(0.580, 1.000),
                    SIMD2<Float>(1.000, 1.000)
                ]),
                colors: .colors([
                    Color(red: 0.800, green: 0.900, blue: 1.000),
                    Color(red: 0.600, green: 0.800, blue: 1.000),
                    Color(red: 1.000, green: 1.000, blue: 1.000),
                    Color(red: 0.500, green: 0.700, blue: 0.900),
                    Color(red: 0.400, green: 0.600, blue: 0.900),
                    Color(red: 0.900, green: 0.900, blue: 1.000),
                    Color(red: 0.400, green: 0.500, blue: 0.700),
                    Color(red: 0.700, green: 0.800, blue: 1.000),
                    Color(red: 0.850, green: 0.950, blue: 1.000)
                ]),
                background: Color(red: 0.700, green: 0.900, blue: 1.000),
                smoothsColors: true
            )
            
            Text("🌸")
                .font(.system(size: 100))
                .rotationEffect(Angle.degrees(isSpinning ? 360 : 0))
                .animation(Animation.linear(duration: 1.5)
                    .repeatForever(autoreverses: false), value: isSpinning)
                .onAppear {
                    isSpinning = true
                }

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



