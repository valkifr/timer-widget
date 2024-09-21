//
//  CountdownListItem.swift
//  timer widget
//
//  Created by Olivér Ungváry on 07/09/2024.
//

import SwiftUI

struct CountdownListItem: View {
    
    let emoji: String
    let title: String
    let days: String
    
    var body: some View {
        HStack {
            Image(uiImage: emoji.image()!)
                .resizable()
                .frame(width: 40.0, height: 40.0)
            Text(title == "" ? "New Countdown" : title)
            Spacer()
            Text(days)
                .font(.system(size: 25, weight: .bold, design: .default))
        }
        .padding([.top, .bottom], 6.0)
    }
}
