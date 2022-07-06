//
//  EditView.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//

import SwiftUI

struct EditView: View {
    @Environment (\.managedObjectContext) var moc
    @State private var showDeleteSheet : Bool = false
    let task : TaskDetails
    var body: some View {
        ScrollView() {
            VStack {
                Text(task.title ?? "unknown name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .padding(.leading)
                Text("Created on \(task.date ?? "unknown date")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                Text(task.desc ?? "unknown desc")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }.foregroundColor(.white)
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(.black)
        .toolbar {
            ToolbarItem {
                Button() {
                    showDeleteSheet.toggle()
                } label: {
                    Label("Options", systemImage: "ellipsis.circle.fill")
                }
                .confirmationDialog("Are you sure?", isPresented: $showDeleteSheet) {
                    Button("Delete Item?", role: .destructive) {
                        moc.delete(task)
                        try? moc.save()
                    }
                }
        
            }
        }
    }
    
    init(task: TaskDetails) {
        self.task = task
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(task: TaskDetails())
    }
}
