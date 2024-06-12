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
    @State var colour = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)

    var body: some View {
        ZStack {
            NavigationStack {
                    List(dates) {
                    Text($0.dateInString)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
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
                        Color(colour)
                    })
                })
            }
        }
    }
}

#Preview {
    ContentView()
}



