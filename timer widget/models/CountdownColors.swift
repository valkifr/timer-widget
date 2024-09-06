//
//  CountdownColors.swift
//  timer widget
//
//  Created by Olivér Ungváry on 02/09/2024.
//

import SwiftUI

enum CountdownColor: String, CaseIterable {
    case red
    case orange
    case yellow
    case green
    case mint
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    case gray
}

extension CountdownColor {
    var color: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .mint:
            return .mint
        case .cyan:
            return .cyan
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .purple:
            return .purple
        case .pink:
            return .pink
        case .brown:
            return .brown
        case .gray:
            return .gray
        }
    }
}
