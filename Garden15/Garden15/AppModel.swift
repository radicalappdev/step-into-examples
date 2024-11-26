//
//  AppModel.swift
//  Garden15
//
//  Created by Joseph Simpson on 11/26/24.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    var mainWindowOpen: Bool = false
    var immersiveSpaceOpen: Bool = false
    var immersiveSpaceValue: String = ""
}
