//
//  AppModel.swift
//  Garden14
//
//  Created by Joseph Simpson on 11/22/24.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    var mainWindowOpen: Bool = false
    var gardenMixedOpen: Bool = false
    var gardenProgressiveOpen: Bool = false
    var gardenFullOpen: Bool = false

    var progressiveGarden: ImmersionStyle = .progressive(
        0.2...0.8,
        initialAmount: 0.4
    )

    /// This willl return true if any one of our immersice spaces are open
    var immersiveSpaceActive: Bool {
        return gardenMixedOpen || gardenProgressiveOpen || gardenFullOpen
    }

    ///
    var upperLimpVis: Visibility = .automatic
}

