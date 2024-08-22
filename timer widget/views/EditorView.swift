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
   
   let countdown: Countdown?
   private var editorTitle: String {
      title == "" ? "New Countdown" : title
   }
   
   @Environment(\.dismiss) private var dismiss
   @Environment (\.modelContext) private var modelContext
   
   
   @State private var title = ""
   @State private var displayEmojiPicker: Bool = false
   @State private var selectedEmoji = "🗓️"
   
   var body: some View {
      NavigationStack {
         Form(content: {
            //              Section("pick a color") {
            //                    ColorPicker("pick a color", selection: $colour)
            //
            //                    HStack {
            //                        RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
            //                            .padding(.vertical)
            //                            .frame(width: 70, height: 100, alignment: .trailing)
            //                        RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
            //                            .padding(.vertical)
            //                            .frame(width: 70, height: 100, alignment: .trailing)
            //                        Button(action: {
            //                            print("pressed")
            //                        }, label: {
            //                            AddColorButton()
            //                        })
            //                        .position(CGPoint(x: 120.0, y: 57.0))
            //                    }
            //                }
            //                Section("pick a date") {
            //                        DatePicker("When should it end?", selection: $date)
            //                            .datePickerStyle(.graphical)
            //                    }
            Section("enter a title and an emoji") {
               HStack {
                  ZStack {
                     RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 60, height: 60)
                     Text(selectedEmoji)
                        .font(.system(size: 45))
                        .background(Color.clear)
                  }
                  .emojiPicker(isPresented: $displayEmojiPicker, selectedEmoji: $selectedEmoji)
                  .onTapGesture {
                     displayEmojiPicker = true
                  }
                  TextField("enter here", text: $title)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                  
               }
            }
         })
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
      } else {
         let newCountdown = Countdown(title: title, emoji: selectedEmoji)
         modelContext.insert(newCountdown)
      }
   }
}



#Preview {
   NewCountdownView(countdown: nil)
}

