//
//  ContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    struct ADate: Identifiable, Hashable {
        let year    :       Int
        let month   :       Int
        let day     :       Int
        let hour    :       Int
        let minute  :       Int
        let dateInString:   String
        let id = UUID()
    }


    private var dates = [
        ADate(year: 2025, month: 3, day: 2, hour: 3, minute: 2, 
              dateInString: "2025-03-02-03-02"),
        ADate(year: 2026, month: 2, day: 3, hour: 3, minute: 2,
              dateInString: "2026-02-03-03-02")
    ]


    var body: some View {
        ZStack {
            NavigationStack {
                
                
                
                List(dates) {
                    Text($0.dateInString)
                }
                .navigationTitle("Countdowns")
            }
            VStack {
             
                Spacer()
                Button("Add new countdown",
                       systemImage: "plus.circle",
                       action: AddNewCountdown)
                .buttonStyle(AddButton())
                .dynamicTypeSize(.xxxLarge)
                .fontWeight(.bold)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}


