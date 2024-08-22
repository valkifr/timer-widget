//
//  CountdownDetail.swift
//  timer widget
//
//  Created by Olivér Ungváry on 19/08/2024.
//

import SwiftUI

struct EmojiView: View {
   
   let title: String
   let emoji: String
   let color: Color
   
   var body: some View {
      ZStack {
         Rectangle()
            .fill(color)
            .ignoresSafeArea(.all)
         VStack {
            ZStack {
               RoundedRectangle(cornerRadius: 5.0)
                  .fill(.black.opacity(0.3))
                  .blendMode(.colorBurn)
                  .frame(width: 120.0, height: 120.0)
               Image(uiImage: emoji.image()!)
                  .resizable()
                  .frame(width: 80.0, height: 80.0)
            }
            Text(title)
               .font(.system(size: 30.0, weight: .medium))
               .foregroundStyle(Color.white)
            Spacer()
         }
         .padding(.top, 150.0)
      }
   }
}

#Preview("emoji") {
   ZStack {
      
      EmojiView(title: "Vacation", emoji: "🗓️", color: Color.blue)
      
   }
}
