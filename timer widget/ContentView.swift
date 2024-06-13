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
                    SheetContentView()
                    })
                    
                })
            }
        }
    }
}

#Preview {
    ContentView()
}



