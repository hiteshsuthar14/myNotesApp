//
//  My_Notes_AppApp.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//

import SwiftUI

@main
struct My_Notes_AppApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) //Keypath, Value
        }
    }
}
