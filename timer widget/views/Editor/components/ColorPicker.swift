//
//  ColorPicker.swift
//  timer widget
//
//  Created by Olivér Ungváry on 02/09/2024.
//

import SwiftUI

struct CountdownColorPicker: View {
    
    @Binding var countdownColor: CountdownColor
    private let columnGrid = Array(repeating: GridItem(.flexible()), count: 6)

    
    var body: some View {
        LazyVGrid(columns: columnGrid) {
            ForEach(CountdownColor.allCases, id: \.self) { color in
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(color.color)
                    .padding(5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        if color == countdownColor {
                            RoundedRectangle(cornerRadius: 3.0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                        }
                    .onTapGesture {
                        withAnimation {
                            countdownColor = color
                    }
                }
            }
        }
    }
}

#Preview {
    CountdownColorPicker(countdownColor: .constant(.indigo))
}
