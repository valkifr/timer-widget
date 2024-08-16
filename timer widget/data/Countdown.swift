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
    
    var title: String
    var emoji: String
    var id: String { title }
    
//    var endDate: Date
//    var color: String
    
    init(title: String, emoji: String/*, endDate: Date, color: String*/) {
        self.title = title
        self.emoji = emoji
//        self.endDate = endDate
//        self.color = color
        
    }
}


