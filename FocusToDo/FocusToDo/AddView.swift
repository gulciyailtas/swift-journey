//
//  AddView.swift
//  FocusToDo
//
//  Created by Gülçiya İltaş on 26.12.2025.
//
import SwiftUI

struct AddView: View {
    @Binding var tasks: [TodoItem]
    @Environment(\.dismiss) var dismiss
    
    @State private var taskTitle = ""
    @State private var selectedPriority: Priority = .orta
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Görev Bilgileri")) {
                    TextField("Ne yapacaksın?", text: $taskTitle)
                        .accessibilityIdentifier("TaskInput")
                    
                    Picker("Öncelik Seviyesi", selection: $selectedPriority) {
                        ForEach(Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }
                }
                
                Button(action: {
                    let newTask = TodoItem(title: taskTitle, isCompleted: false, priority: selectedPriority)
                    tasks.append(newTask)
                    dismiss()
                }) {
                    Text("Listeye Ekle")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .accessibilityIdentifier("SaveButton")
                .disabled(taskTitle.isEmpty)
            }
            .navigationTitle("Yeni Görev")
        }
    }
}
