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
    
//    var container: ModelContainer = {
//        let schema = Schema([CountdownItem.self])
//        let configuratioin = ModelConfiguration("config", groupContainer: <#T##ModelConfiguration.GroupContainer#>, cloudKitDatabase: <#T##ModelConfiguration.CloudKitDatabase#>)
//        let container = ModelContainer(for: schema, configurations: <#T##[ModelConfiguration]#>)
//        
//    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [CountdownItem.self])
    }
}



