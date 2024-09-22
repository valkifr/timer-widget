//
//  NewCountdownView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/07/2024.
//
import UserNotifications
import MCEmojiPicker
import SwiftUI
import SwiftData

struct NewCountdownView: View {
    
    var countdown: Countdown? = nil
    
    var editorTitle: String
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var displayEmojiPicker = false
    
    @State private var title = ""
    @State private var emoji = "🗓️"
    @State private var date = Date()
    @State private var color: CountdownColor = .red
    @State private var alertDate = Date.now
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    VStack(spacing: 5) {
                        CountdownIcon(text: $emoji, toggle: $displayEmojiPicker, bgColor: color.color, size: 100)
                            .emojiPicker(isPresented: $displayEmojiPicker, selectedEmoji: $emoji)
                        
                        TextField("Vacation", text: $title)
                            .textFieldStyle(GrayTextFieldStyle())
                            .padding(6.0)
                    }
                }
                Section() {
                    
                    Group {
                        DatePicker("countdown:", selection: $date, in: Date()..., displayedComponents: .date)
                        
                        DatePicker("alert:", selection: $alertDate, in: Date()..., displayedComponents: .hourAndMinute)
                    }
                    .padding(1.0)
                }
                .listRowSeparator(.hidden)
                Section() {
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
                    Text(editorTitle)
                        .font(.headline)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .tint(color.color)
    }
    private func save() {
        if let countdown {
            countdown.title = title
            countdown.emoji = emoji
            countdown.endDate = date
            countdown.color = color.rawValue
            countdown.alertDate = alertDate
            
            scheduleNotification(for: countdown)
        } else {
            let newCountdown = Countdown(title: title, emoji: emoji, endDate: date, alertDate: alertDate, color: color.rawValue)
            scheduleNotification(for: newCountdown)
            modelContext.insert(newCountdown)
        }
    }
    func scheduleNotification(for notificationCountdown: Countdown) {
        let content = UNMutableNotificationContent()
        content.title = "\(emoji)\(title)"
        content.body = "its time"
        content.sound = .default
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: notificationCountdown.alertDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully for \(notificationCountdown.title)!")
            }
        }
    }
    
}



#Preview {
    NewCountdownView(editorTitle: "hawk tuah")
}

