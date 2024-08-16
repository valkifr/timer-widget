//
//  ContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var isShowing = false
    
    @Query(sort: \Countdown.title, animation: .bouncy) var countdowns: [Countdown]
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(countdowns) { countdown in
                    Text(countdown.title)
                        .padding(EdgeInsets(top: 7, leading: 0, bottom: 8.7, trailing: 10))
                    }
                    .navigationTitle("Countdowns")
                }
            
                VStack {
                Spacer()
                Button("Add new countdown", systemImage: "plus.circle", action: {
                    isShowing.toggle()
                })
                .buttonStyle(AddCountdownButton())
                .sheet(isPresented: $isShowing, content: {
                    NewCountdownView(countdown: nil)
                    })
                    
                }
            }
        }
    }


#Preview {
    ContentView()
}



