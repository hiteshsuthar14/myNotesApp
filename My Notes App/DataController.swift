//
//  DataController.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "AppDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to load \(error.localizedDescription)")
            }
        }
    }
}
