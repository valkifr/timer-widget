//
//  ButtonConfiguatio.swift
//  timer widget
//
//  Created by Olivér Ungváry on 05/06/2024.
//

import Foundation
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
    
    var body: some View {
        
    Form(content: {
        Text("Content")
        ColorPicker("pick a color", selection: $colour)
        Button("confirm color") {
            print(colour)

        }
        Color(colour)
    }
}
         }
