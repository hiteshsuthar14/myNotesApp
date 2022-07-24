//
//  EditView.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//

import SwiftUI

struct EditView: View {
    let screenSize: CGFloat = UIScreen.main.bounds.size.height
    @Environment (\.managedObjectContext) var moc
    @State private var showDeleteSheet : Bool = false
    @State private var newTitle : String
    @State private var newDesc : String
    @FocusState var isInputActive: Bool
    
    
    let task : TaskDetails
    
    var body: some View {
        List {
            ZStack {
                TextEditor(text: $newTitle)
                    .font(.largeTitle)

            }
            ZStack(alignment: .leading) {
                if ((newDesc).isEmpty) {
                    Text("Add description")
                }
                TextEditor(text: $newDesc)
                    .font(.body)
                    .opacity(0.8)
                    .focused($isInputActive)
            }
            Text(dateFormatter().string(from: task.date ?? Date()))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
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
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                    self.task.title = self.newTitle
                    self.task.desc = self.newDesc
                    if moc.hasChanges {
                        try? self.moc.save()
                    }
                }
            }
        }
    }
    
    init(task: TaskDetails) {
        self.task = task
        self.newTitle = task.title ?? "unknown"
        self.newDesc = task.desc ?? "unknown"
        UITextView.appearance().backgroundColor = .clear //Clearing TextEditor Background color
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(task: TaskDetails())
    }
}
