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
    
//    @State private var colour = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
//    @State private var date = Date.now
    let countdown: Countdown?
    private var editorTitle: String {
        title == "" ? "New Countdown" : title
    }
    
    @Environment(\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    
    @State private var emoji = "😸"
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
                
                Section("enter a title") {
                    TextField("enter here", text: $title)
                }
                Section("pick out an emoji") {
                    HStack {
                        Button(action: {
                            displayEmojiPicker = true
                        }, label: {
                            Text("Select \n New Emoji")
                                .multilineTextAlignment(.center)
                            Image(systemName: "theatermask.and.paintbrush.fill")
                        })
                        .emojiPicker(isPresented: $displayEmojiPicker, selectedEmoji: $selectedEmoji)
                        .padding([.bottom, .top], 60.0)
                        .padding(.leading, 40.0)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 7.0)
                                .stroke(Color(red: 0.820, green: 0.820, blue: 0.820, opacity: 1.000), lineWidth: 2.0)
                                .frame(width: 170.0, height: 170.0)
                                .position(CGPoint(x: 130.0, y: 100.0))
                                .foregroundStyle(.green)
                            Text(selectedEmoji)
                                .font(.custom("emoji", size: 120.0))
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 40.0)
                            
                            
                            
                        }
                    }
                }
            })
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        save()
                        dismiss()
                        print("saved")
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
            countdown.emoji = emoji
        } else {
            let newCountdown = Countdown(title: title, emoji: emoji)
            modelContext.insert(newCountdown)
        }
    }
}



#Preview {
    NewCountdownView(countdown: nil)
}
