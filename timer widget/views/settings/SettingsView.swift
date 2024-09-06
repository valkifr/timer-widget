//
//  Settings.swift
//  timer widget
//
//  Created by Olivér Ungváry on 19/08/2024.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    
    @Query var countdowns: [Countdown]
    
    @State private var isAlertShowing = false
    
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                Button("Delete All Data") {
                    isAlertShowing = true
                }
                .alert("Are you sure", isPresented: $isAlertShowing) {
                    Button("Yes", role: .destructive) {
                        do {
                            try modelContext.delete(model: Countdown.self)
                        } catch {
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }
                } message: {
                    Text("this cant be undone")
                }
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done", role: .cancel) {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Settings")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
