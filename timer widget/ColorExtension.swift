//
//  ColorExtension.swift
//  timer widget
//
//  Created by Olivér Ungváry on 11/06/2024.
//

import UIKit
import SwiftUI

#if os(iOS)
typealias PlatformColor = UIColor
extension Color {
    init(platformColor: PlatformColor) {
        self.init(uiColor: platformColor)
    }
}
#elseif os(macOS)
typealias PlatformColor = NSColor
extension Color {
    init(platformColor: PlatformColor) {
        self.init(nsColor: platformColor)
    }
}
#endif

let color = Color(.sRGB, red: 0, green: 0, blue: 1, opacity: 1)

func encodeColor() throws -> Data {
    let platformColor = PlatformColor(color)
    return try NSKeyedArchiver.archivedData(
        withRootObject: platformColor,
        requiringSecureCoding: true
    )
}

func decodeColor(from data: Data) throws -> Color {
    guard let platformColor = try NSKeyedUnarchiver
//            .unarchiveTopLevelObjectWithData(data) as? PlatformColor
        .unarchivedObject(ofClass: PlatformColor.self, from: data)
        else {
            throw DecodingError.wrongType
        }
    return Color(platformColor: platformColor)
}

enum DecodingError: Error {
    case wrongType
}
