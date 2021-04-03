//
//  ToDoList.swift
//  ToDo
//
//  Created by Kanz on 2021/04/01.
//

import SwiftUI

/// 할일 리스트뷰
struct ToDoList: View {
    @EnvironmentObject var storage: ToDoStorage
    
    // If you are getting the "can only present once" issue, add this here.
    // Fixes the problem, but not sure why; feel free to edit/explain below.
    @Environment(\.presentationMode) var presentationMode
    @State private var editToDo: ToDoModel?
    
    var body: some View {
        List {
            ForEach(storage.todoItems, id: \.self) { item in
                ToDoCell(todoItem: item) {
                    self.complete(item)
                } editButtonTapped: {
                    self.editToDo = item
                } deleteButtonTapped: {
                    self.delete(item)
                }
            }
            .onDelete(perform: delete)
        }
        .listStyle(PlainListStyle())
        .sheet(item: $editToDo) { item in
            ToDoEditView(toDoItem: item)
                .environmentObject(storage)
        }
    }
    
    func complete(_ item: ToDoModel) {
        let isCompleted = item.isCompleted
        storage.updateToDoComplete(id: item.id,
                                   isCompleted: !isCompleted)
    }
    
    func delete(_ item: ToDoModel) {
        storage.deleteToDo(item)
    }
    
    func delete(at offsets: IndexSet) {
        storage.deleteToDo(index: offsets)
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
            .environmentObject(ToDoStorage())
    }
}
