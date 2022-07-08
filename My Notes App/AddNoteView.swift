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

struct AddNoteView: View {
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    @State private var title = ""
    @State private var desc = ""
    @State private var date = ""
    @State private var dateFormatter = DateFormatter()
    @State private var color = ""
    let colors = [ "Color.red", "Color.green", "Color.blue", "Color.brown" ]
    var body: some View {
        NavigationView { // To add toolbar we need a navigation view
            List {
                TextField("Note Title", text: $title)
                TextEditor(text: $desc)
            }
            .navigationTitle("New task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let NewTaskDetails = TaskDetails(context: moc)
                        NewTaskDetails.title = title
                        NewTaskDetails.desc = desc
                        
                        let tempdate = Date()
                        dateFormatter.dateStyle = .long
                        NewTaskDetails.date = dateFormatter.string(from: tempdate)
                        
                        NewTaskDetails.id = UUID()
                        NewTaskDetails.color = colors.randomElement()
                        
                        try? moc.save()
                        dismiss()
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
