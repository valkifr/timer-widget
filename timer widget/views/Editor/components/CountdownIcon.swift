//
//  CountdownIcon.swift
//  timer widget
//
//  Created by Olivér Ungváry on 03/09/2024.
//

import SwiftUI

struct CountdownIcon: View {
    
    @Binding var text: String
    @Binding var toggle: Bool
    
    var bgColor: Color
    
    let size: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .fill(bgColor.gradient)
                .frame(width: size, height: size)

            
            Button { toggle = true } label: { }
            
            Text(text)
                .font(.system(size: 65))
        }
    }
}
