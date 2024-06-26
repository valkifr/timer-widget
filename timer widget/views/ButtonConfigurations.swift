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

struct AddColorButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                .padding(.vertical)
                .frame(width: 70, height: 100)
                .foregroundStyle(Color(CGColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)))
            Image(systemName: "plus")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .fontWeight(.bold)
                .foregroundStyle(Color(CGColor(gray: 0.35, alpha: 1.0)))
            
        }
    }
}

struct DefaultColorButton: View {
    
    var defaultColor: Color
    
    var body: some View {
        Button(action: {
        
        }, label: {
            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                .padding(.vertical)
                .frame(width: 70, height: 100, alignment: .trailing)
                .foregroundStyle(defaultColor)
        })
    }
}


#Preview {
    VStack {
        AddColorButton()
        DefaultColorButton(defaultColor: Color(red: 0.949, green: 0.769, blue: 0.239, opacity: 1.000))
    }
}
