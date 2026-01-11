//
//  TodoModel.swift
//  FocusToDo
//
//  Created by Gülçiya İltaş on 26.12.2025.
//
import Foundation

enum Priority: String, CaseIterable {
    case yuksek = "🔴 Yüksek"
    case orta = "🟡 Orta"
    case dusuk = "🟢 Düşük"
}

struct TodoItem: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var priority: Priority
    
    // Açık init eklemek id = UUID() satırının test edilmesini sağlar
    init(id: UUID = UUID(), title: String, isCompleted: Bool, priority: Priority) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
    }
}
