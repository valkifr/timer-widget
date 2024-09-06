//
//  CountdownDetail.swift
//  timer widget
//
//  Created by Olivér Ungváry on 19/08/2024.
//

import SwiftUI

struct CountdownDetailView: View {
    
    let title: String
    let emoji: String
    let color: Color
    var date: String
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 100, height: 100)
            }
            .position(x: proxy.frame(in: .local).midX,
                      y: proxy.frame(in: .local).midY)
            
        }
    }
}

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

#Preview("emoji") {
    CountdownDetailView(title: "Vacation", emoji: "🗓️", color: Color.blue, date: Date().description)
}
