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
final class CountdownItem: Codable {
    
    enum CodingKeys: CodingKey {
    case title, emoji, endDate, color
        
    }
    
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
    
    
    required init(from decoder: Decoder) {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        title   = try container.decode(String.self, forKey: .title)
        emoji = try container.decode(Character.self, forKey: .emoji)
        endDate = try container.decode(Date.self, forKey: .endDate)
        color = try container.decode(Color.self, forKey: .color)
        
        
    }
}
