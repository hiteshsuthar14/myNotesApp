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
    let columns = [GridItem(.adaptive(minimum: 120))] //add item if 150 points availabe on screen
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20 ) {
                    ForEach(tasks) { task in
                        NavigationLink {
                            EditView(task: task)
                        }
                        label : {
                            LazyVStack (alignment: .leading){
                                Text(task.title ?? "unknown")
                                    .font(.title2)
//                                    .opacity(0.9)
//                                    .padding([.horizontal, .vertical], 12)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 3)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(4)
                                    .frame(width: 150, height: 120, alignment: .topLeading)
                                    
                                Text(dateFormatter().string(from: task.date ?? Date()))
                                    .font(.system(size: 18))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 3)
//                                    .padding([.horizontal, .vertical], )
                                    .foregroundColor(Color("Gray"))
                            }
//                            .onAppear{
//                                changeColor()
//                            }
                            .frame(minWidth: 150, minHeight : 150, maxHeight: 150)
                            .padding(12)
                            .foregroundColor(Color("Black"))
                            .onAppear()
                            .background(tileColors[changeColor()])
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                    }
//                  .onDelete(perform: deleteItem)
                }
                .navigationTitle("Notes")
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
        }
    }
    func changeColor() -> Int{
//        color = (colorPointer) % 2
        colorPointer += 1
        return colorPointer % 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
