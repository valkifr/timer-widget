//
//  SheetContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 26/06/2024.
//

import SwiftUI

struct SheetContentView: View {
    
    @State var colour = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    @State var date = Date()
    
    var body: some View {
        Form(content: {
        Section("pick a color") {
            ColorPicker("pick a color", selection: $colour)
            
            HStack {
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .padding(.vertical)
                    .frame(width: 70, height: 100, alignment: .trailing)
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .padding(.vertical)
                    .frame(width: 70, height: 100, alignment: .trailing)
                Button(action: {
                     print("pressed")
                     }, label: {
                     AddColorButton()
                })
            .position(CGPoint(x: 120.0, y: 57.0))

                
                
                }
            }
        Section("pick a date") {
            DatePicker("When should it end?", selection: $date)
                .datePickerStyle(.graphical)
        }
        })
    }
}

#Preview {
    SheetContentView()
}
