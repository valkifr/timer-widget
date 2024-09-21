//
//  EmojiView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 01/09/2024.
//

import SwiftUI

struct EmojiView: View {
    
    let emoji: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.black)
            .opacity(0.2)
            .frame(width: 140, height: 140)
            .overlay {
                Image(uiImage: emoji.image() ?? .remove)
                    .resizable()
                    .frame(width: 130, height: 130)
            }
    }
}

#Preview {
    EmojiView(emoji: "🔓")
}



