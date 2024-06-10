//
//  ContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var isShowing = false
    @State var colour = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

    var body: some View {
        ZStack {
            NavigationStack {
                    List(dates) {
                    Text($0.dateInString)
                        .padding()
                    }
                    .navigationTitle("Countdowns")
                }
                VStack {
                Spacer()
                Button("Add new countdown", systemImage: "plus.circle", action: {
                    isShowing.toggle()
                })
                .buttonStyle(AddButton())
                .sheet(isPresented: $isShowing, content: {
                    Form(content: {
                        Text("Content")
                        ColorPicker("pick a color", selection: $colour)
                        Button("confirm color") {
                                print(colour)

                        }
                    })
                })
            }
        }
    }
}

#Preview {
    ContentView()
}



