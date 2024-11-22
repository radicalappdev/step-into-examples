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
}

