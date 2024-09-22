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
                requestNotificationPermission()
            }
            .buttonStyle(AddCountdownButton())
            .sheet(isPresented: $toggle) {
                NewCountdownView(editorTitle: "Add New Countdown")
            }
            .padding()
        }
    }
}

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("Permission granted!")
        } else if let error = error {
            print("Error requesting notifications permission: \(error.localizedDescription)")
        }
    }
}
