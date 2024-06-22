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
    

    var body: some View {
        ZStack {
            NavigationStack {
                    List() {
                    Text("date placeholder")
                            .padding(EdgeInsets(top: 7, leading: 0, bottom: 8.7, trailing: 10))
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
                    SheetContentView()
                    })
                    
                }
            }
        }
    }


#Preview {
    ContentView()
}



