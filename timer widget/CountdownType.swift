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

//@Model
//final class CountdownItem: Codable {
//    
//    enum CodingKeys: String, CodingKey {
//    case title = "title"
//    case emoji = "emoji"
//    case endDate = "end_date"
//    case color = "color"
//        
//        
//    }
//    
//    var title: String
//    var emoji: String
//    var endDate: Date
//    var color: String
//    
//    init(title: String, emoji: String, endDate: Date, color: String) {
//        self.title = title
//        self.emoji = emoji
//        self.endDate = endDate
//        self.color = color
//    }
//    
//    
//    required init(from decoder: Decoder) {
//        let container = try? decoder.container(keyedBy: CodingKeys.self)
//        title   = try container.decode(String.self, forKey: .title)
//        emoji = try container.decode(String.self, forKey: .emoji)
//        endDate = try container.decode(Date.self, forKey: .endDate)
//        color = try container.decode(String.self, forKey: .color)
//        
//        
//    }
//}
