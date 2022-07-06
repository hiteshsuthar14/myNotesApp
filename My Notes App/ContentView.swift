//
//  ContentView.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks: FetchedResults <TaskDetails>
    @State private var showingSheet = false
    @State private var showActionSheet: Bool = false
    let columns = [GridItem(.adaptive(minimum: 150))] //add item if 150 points availabe on screen
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20 ) {
                    ForEach(tasks) { task in
                        NavigationLink {
                            EditView(task: task)
                        }
                        label : {
                            VStack(alignment: .leading) {
                                Text(task.title ?? "Unnamed task")
                                    .font(.title)
                                Text(task.date ?? "")
                                    
                            }
                            .frame(minWidth: 150, minHeight : 150, maxHeight: 300)
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Notes").foregroundColor(.white)
                .toolbar {
                    Button() {
                        showingSheet.toggle()
                    }
                    label: {
                        Label("Add Item" , systemImage: "plus")
                    }
                }
                .sheet(isPresented: $showingSheet) {
                    AddNoteView()
                }
            }
            .padding()
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(.black)
        }
    }
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]
            moc.delete(task)
        }
        try? moc.save()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
