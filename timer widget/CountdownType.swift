//
//  CountdownType.swift
//  timer widget
//
//  Created by Olivér Ungváry on 10/06/2024.
//

import Foundation
import SwiftData
import SwiftUI

struct Countdown: Codable, Hashable, Identifiable {
    var id = UUID()
    
}

@Model
final class CountdownItem {
    var title: String
    var emoji: Character
    var endDate: Date
    var color: Color
    
    init(title: String, emoji: Character, endDate: Date, color: Color) {
        self.title = title
        self.emoji = emoji
        self.endDate = endDate
        self.color = color
    }
}
