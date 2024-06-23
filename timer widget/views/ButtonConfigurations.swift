//
//  ButtonConfiguatio.swift
//  timer widget
//
//  Created by Olivér Ungváry on 05/06/2024.
//

import SwiftUI

struct AddButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0.118, green: 0.141, blue: 0.376))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .dynamicTypeSize(.xxxLarge)
            .fontWeight(.bold)
            .padding()
    }
}



struct SheetContentView: View {
    
    @State var colour = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    @State var date = Date()
    
    var body: some View {
        ToolbarItem(placement: .confirmationAction) {
            Button() {
                print("\(colour)")
            } label: {
                Text("save")
            }
        }
    Form(content: {
        
        Section("pick a color") {
            ColorPicker("pick a color", selection: $colour)
            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                .padding(.vertical)
                .frame(width: 100, height: 100, alignment: .trailing)
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
