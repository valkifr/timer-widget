//
//  ContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowing = false


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
                        /*@START_MENU_TOKEN@*/Text("Content")/*@END_MENU_TOKEN@*/
                        DatePicker(<#T##title: StringProtocol##StringProtocol#>, selection: <#T##Binding<Date>#>, displayedComponents: <#T##DatePicker<Text>.Components#>)
                    })
                })
            }
        }
    }
}

#Preview {
    ContentView()
}


