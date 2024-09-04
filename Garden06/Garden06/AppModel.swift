//
//  AppModel.swift
//  Garden06
//
//  Created by Joseph Simpson on 8/15/24.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    var mainWindowOpen: Bool = true
    var yellowFlowerOpen: Bool = false
}
