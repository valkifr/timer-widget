//
//  CountdownType.swift
//  timer widget
//
//  Created by Olivér Ungváry on 10/06/2024.
//

import SwiftData
import SwiftUI


@Model
class Countdown: Identifiable {
    
    @Attribute (.unique) var title: String
    var emoji: String
    var id: String { title }
    var endDate: Date

    init(title: String, emoji: String, endDate: Date) {
        self.title = title
        self.emoji = emoji
        self.endDate = endDate
    }
}


