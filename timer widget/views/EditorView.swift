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
  
  @Environment(\.dismiss) private var dismiss
  @Environment (\.modelContext) private var modelContext
  
  @State private var title = ""
  @State private var displayEmojiPicker: Bool = false
  @State private var selectedEmoji = "🗓️"
  @State private var selectedDate = Date()
  
  var body: some View {
    NavigationStack {
      Form {
        Section("enter a title and an emoji") {
          HStack {
            
            RoundedRectangle(cornerRadius: 5)
              .stroke(Color(red: 0.898, green: 0.898, blue: 0.898), lineWidth: 1)
              .frame(width: 60, height: 60)
              .emojiPicker(isPresented: $displayEmojiPicker, selectedEmoji: $selectedEmoji)
              .overlay {
                Text(selectedEmoji)
                  .font(.system(size: 45))
                  .background(Color.clear)
              }
              .onTapGesture {
                displayEmojiPicker = true
              }
            
            TextField("enter here", text: $title)
              .textFieldStyle(RoundedBorderTextFieldStyle())
          }
        }
        Section("enter an end date") {
          DatePicker("enter a future date", selection: $selectedDate, in: Date()...)
            .datePickerStyle(.wheel)
        }
      }
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("Save") {
            save()
            dismiss()
            print(selectedEmoji)
          }
        }
        ToolbarItem(placement: .principal) {
          Text(editorTitle)
            .font(.headline)
        }
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            dismiss()
            print("canceled")
          }
        }
      }
    }
  }
  private func save() {
    if let countdown {
      countdown.title = title
      countdown.emoji = selectedEmoji
      countdown.endDate = selectedDate
    } else {
      let newCountdown = Countdown(title: title, emoji: selectedEmoji, endDate: selectedDate)
      modelContext.insert(newCountdown)
    }
  }
}



#Preview {
  NewCountdownView()
}

