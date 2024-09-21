//
//  ButtonConfiguatio.swift
//  timer widget
//
//  Created by Olivér Ungváry on 05/06/2024.
//

import SwiftUI

struct AddCountdownButton: ButtonStyle {
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

struct GrayTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .background(Color(uiColor: .systemGray6))
            .cornerRadius(8)
    }
}
