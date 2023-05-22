//
//  reconlabsSampleApp.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/22.
//

import SwiftUI

@main
struct reconlabsSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
