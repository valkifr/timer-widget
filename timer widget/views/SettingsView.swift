//
//  Settings.swift
//  timer widget
//
//  Created by Olivér Ungváry on 19/08/2024.
//

import SwiftUI
import SwiftData

struct Settings: View {
    
    @Query var countdowns: [Countdown]
    @Environment (\.modelContext) private var modelContext
    
    var body: some View {
        Form {
            Button("Delete All Data") {
                print("123")
            }
        }
    }
}

#Preview {
    Settings()
}
