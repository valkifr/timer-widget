//
//  timer_widgetApp.swift
//  timer widget
//
//  Created by Olivér Ungváry on 04/06/2024.
//

import SwiftUI
import SwiftData

@main
struct timer_widgetApp: App {
   
   var container: ModelContainer {
      let schema = Schema([Countdown.self])
      let config = ModelConfiguration(schema: schema, allowsSave: true, groupContainer: ModelConfiguration.GroupContainer.identifier("group.com.timer-widget.container"))
      
      do {
         return try ModelContainer(for: schema, configurations: config)
      } catch {
         fatalError("Could not create ModelContainer: \(error)")
      }
      
   }
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      .modelContainer(container)
   }
}



