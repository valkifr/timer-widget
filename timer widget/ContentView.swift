//
//  ContentView.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
  @State private var isShowingNewCountdown = false // Clearer variable name
  @State private var isShowingSettings = false
  
  @Query(sort: \Countdown.title) var countdowns: [Countdown]
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(countdowns) { countdown in
          NavigationLink {
            EmojiView(title: countdown.title, emoji: countdown.emoji, color: .green)
          } label: {
            HStack {
              Image(uiImage: countdown.emoji.image()!)
                .resizable()
                .frame(width: 40.0, height: 40.0)
              Text(countdown.title)
            }
          }
          .padding([.top, .bottom], 6.0)
        }
        .navigationTitle("Countdowns")
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button(action: {
            isShowingSettings.toggle() // Toggle settings view
          }, label: {
            Image(systemName: "gear")
          })
        }
      }
    }
    .overlay {
      VStack {
        Spacer()
        Button("Add new countdown", systemImage: "plus.circle") {
          isShowingNewCountdown.toggle()
        }
        .buttonStyle(AddCountdownButton())
        .sheet(isPresented: $isShowingNewCountdown) {
          NewCountdownView()
          
        }
        
      }
    }
  }
}

#Preview {
  
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Countdown.self, configurations: config)
  
  for i in 1..<10 {
    let countdown = Countdown(title: "Example Countdown \(i)", emoji: "🗓️", endDate: Date())
    container.mainContext.insert(countdown)
  }
  
  return ContentView()
    .modelContainer(container)
}
