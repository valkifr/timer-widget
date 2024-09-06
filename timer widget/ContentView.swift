//
//  ContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI
import SwiftData


import SwiftUI
import SwiftData


struct ContentView: View {
    @State private var isShowingNewCountdown = false
    @State private var isShowingSettings = false
    @State private var isDetailsViewShowing = false
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Countdown.title) var countdowns: [Countdown]
    
    var body: some View {
        NavigationStack {
            List {
               
                    ForEach(countdowns) { countdown in
                        NavigationLink {
                            CountdownDetailView(title: countdown.title,
                                                emoji: countdown.emoji,
                                                color: CountdownColor(rawValue: countdown.color)!.color,
                                                date: Date().description)
                            .onAppear {
                                withAnimation {
                                    isDetailsViewShowing = true
                                }
                            }
                        } label: {
                            CountdownListItem(emoji: countdown.emoji, title: countdown.title, days: remainingDays(to: countdown.endDate))
                                .onAppear {
                                    withAnimation {
                                        isDetailsViewShowing = false
                                    }
                                }
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                modelContext.delete(countdown)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            .navigationTitle("Countdowns")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isShowingSettings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                }
            }
        }
        .overlay {
            if !isDetailsViewShowing {
                AddButton(buttonTitle: "Add new countdown", toggle: isShowingNewCountdown)
                    .transition(.move(edge: .bottom))
            }
            if countdowns.isEmpty {
                ContentUnavailableView("No countdowns yet", systemImage: "calendar.badge.exclamationmark", description: Text("You can add a new countdown\nwith the button below ↓"))
            }
        }
    }
}

func remainingDays(to futureDate: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d" // Display only days (e.g., "10d")
    let currentDate = Date()
    let timeInterval = futureDate.timeIntervalSince(currentDate)
    return formatter.string(from: Date(timeIntervalSince1970: timeInterval.rounded(.down)))
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Countdown.self, configurations: config)
    
    for i in 1..<10 {
        let countdown = Countdown(title: "Example \(i)", emoji: "🗓️", endDate: Date().addingTimeInterval(3600 * 24 * 30), color: CountdownColor.red.rawValue)
        container.mainContext.insert(countdown)
    }
    
    return ContentView()
        .modelContainer(container)
}

#Preview("no") {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Countdown.self, configurations: config)
    
    
    return ContentView()
        .modelContainer(container)
}
