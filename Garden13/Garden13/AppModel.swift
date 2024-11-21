//
//  AppModel.swift
//  Garden13
//
//  Created by Joseph Simpson on 11/21/24.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    var mainWindowOpen: Bool = false
    var gardenOpen: Bool = false
}

