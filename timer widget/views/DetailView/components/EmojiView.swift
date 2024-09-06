//
//  EmojiView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 01/09/2024.
//

import SwiftUI

struct EmojiView: View {
    
    let title: String
    let emoji: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5.0)
            .fill(.black.opacity(0.3))
            .blendMode(.colorBurn)
            .frame(width: 120.0, height: 120.0)
            .overlay {
                Image(uiImage: emoji.image()!)
                .resizable()
                .frame(width: 80.0, height: 80.0)
            }
            
            Text(title)
                .font(.system(size: 30.0, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    EmojiView(title: "bazdmegh", emoji: "🔓")
}



