//
//  AddNoteView.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//
/**
 - parameter name :
 - parameter name :
 - returns :
 - throws :
 
 */
import SwiftUI
import UIKit

struct AddNoteView: View {
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    @State private var title = ""
    @State private var desc = ""
    @State private var date = Date()
    @State private var color = ""
    let colors = [ "Color.red", "Color.green", "Color.blue", "Color.brown" ]
    var body: some View {
        NavigationView { // To add toolbar we need a navigation view
            List {
                ZStack(alignment: .leading) {
                    if title.isEmpty {
                        Text("Note Title")
                    }
                    TextEditor(text: $title)
                }
                
                ZStack(alignment: .leading) {
                    if desc.isEmpty {
                        Text("Enter Description")
                    }
                    TextEditor(text: $desc)
                }
            }
            .foregroundColor(.gray)
            .navigationTitle("New task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let NewTaskDetails = TaskDetails(context: moc)
                        NewTaskDetails.title = title
                        NewTaskDetails.desc = desc
                        NewTaskDetails.date = date
                        NewTaskDetails.id = UUID()
                        NewTaskDetails.color = colors.randomElement()
                        
                        if moc.hasChanges {
                            try? moc.save()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
