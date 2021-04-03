//
//  ToDoStorage.swift
//  ToDo
//
//  Created by Kanz on 2021/03/29.
//

import Combine
import SwiftUI
import Foundation
import UIKit

/// ToDo 저장소..
final class ToDoStorage: ObservableObject {
    @Published var todoItems: [ToDoModel] = []
    
    // MARK: CRUD
    func fetch() {
        guard let data = UserDefaults.standard.object(forKey: "ToDoList") as? Data else { return }
        let decoder = JSONDecoder()
        if let list = try? decoder.decode([ToDoModel].self, from: data) {
            todoItems = list
        }
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(todoItems) {
            UserDefaults.standard.set(encoded, forKey: "ToDoList")
        }
    }
    
    func addToDo(_ todo: ToDoModel) {
        todoItems.append(todo)
        
        save()
    }

    func updateToDoComplete(id: UUID, isCompleted: Bool) {
        guard let index = todoItems.firstIndex(where: { $0.id == id }) else { return }
        self.todoItems[index].isCompleted = isCompleted
        
        save()
    }
    
    func updateToDoTask(id: UUID, task: String) {
        guard let index = todoItems.firstIndex(where: { $0.id == id }) else { return }
        self.todoItems[index].task = task
        
        save()
    }
    
    func deleteToDo(_ todo: ToDoModel) {
        guard let index = todoItems.firstIndex(where: { $0.id == todo.id }) else { return }
        todoItems.remove(at: index)
        
        save()
    }
    
    func deleteToDo(index: IndexSet) {
        todoItems.remove(atOffsets: index)
        
        save()
    }
}

