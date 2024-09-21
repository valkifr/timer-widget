//
//  AddButton.swift
//  timer widget
//
//  Created by Olivér Ungváry on 01/09/2024.
//

import SwiftUI

struct AddButton: View {
    
    let buttonTitle: String
    
    @State var toggle: Bool
    
    
    var body: some View {
        VStack {
            Spacer()
            Button(buttonTitle, systemImage: "plus.circle") {
                toggle = true
            }
            .buttonStyle(AddCountdownButton())
            .sheet(isPresented: $toggle) {
                NewCountdownView()
            }
            .padding()
        }
    }
}
