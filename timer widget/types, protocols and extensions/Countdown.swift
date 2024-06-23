//
//  CountdownType.swift
//  timer widget
//
//  Created by Olivér Ungváry on 10/06/2024.
//

import Foundation
import SwiftUI

struct Countdown: Codable, Hashable, Identifiable {
    var id = UUID()
    
}






class CountdownItem {
    
    var title: String
    var emoji: String
    var endDate: Date
    var color: String
    
    init(title: String, emoji: String, endDate: Date, color: String) {
        self.title = title
        self.emoji = emoji
        self.endDate = endDate
        self.color = color
        
    }
}
