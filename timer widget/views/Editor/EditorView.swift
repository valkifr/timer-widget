//
//  NewCountdownView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/07/2024.
//
import MCEmojiPicker
import SwiftUI
import SwiftData

struct NewCountdownView: View {
    
    private let countdown: Countdown? = nil
    
    private var editorTitle: String {
        title == "" ? "New Countdown" : title
    }
    
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    
    @State private var displayEmojiPicker = false
    
    @State private var title = ""
    @State private var emoji = "🗓️"
    @State private var date = Date()
    @State private var color: CountdownColor = .red
    
    var body: some View {
        NavigationStack {
            Form {
                Section("enter a title and an emoji") {
                    VStack(spacing: 5) {
                        CountdownIcon(text: $emoji, toggle: $displayEmojiPicker, bgColor: color.color, size: 100)
                            .emojiPicker(isPresented: $displayEmojiPicker, selectedEmoji: $emoji)
                        TextField("Vacation", text: $title)
                            .textFieldStyle(GrayTextFieldStyle())
                            .padding(6.0)
                    }
                }
                Section("enter an end date") {
                    DatePicker("Select a date", selection: $date, in: Date()...)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding(1.0)
                }
                Section("select a color") {
                    CountdownColorPicker(countdownColor: $color)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        save()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(title == "" ? "New Countdown" : title)
                        .font(.headline)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    private func save() {
        if let countdown {
            countdown.title = title
            countdown.emoji = emoji
            countdown.endDate = date
            countdown.color = color.rawValue
        } else {
            let newCountdown = Countdown(title: title, emoji: emoji, endDate: date, color: color.rawValue)
            modelContext.insert(newCountdown)
        }
    }
}



#Preview {
    NewCountdownView()
}

