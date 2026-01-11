//
//  ContentView.swift
//  FocusToDo
//
//  Created by Gülçiya İltaş on 26.12.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [TodoItem] = [
        TodoItem(title: "Dosyaları ayır", isCompleted: true, priority: .yuksek)
    ]
    
    @State private var showAddSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                            .onTapGesture {
                                toggleTask(task: task)
                            }
                        
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                        
                        Spacer()
                        
                        Text(task.priority.rawValue)
                            .font(.caption)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Odak Listem")
            .toolbar {
                Button(action: { showAddSheet.toggle() }) {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                // Az önce oluşturduğumuz diğer dosyayı burada çağırıyoruz
                AddView(tasks: $tasks)
            }
        }
    }

    func toggleTask(task: TodoItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
