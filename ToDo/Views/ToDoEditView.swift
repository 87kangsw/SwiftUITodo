//
//  ToDoEditView.swift
//  ToDo
//
//  Created by Kanz on 2021/04/03.
//

import SwiftUI

struct ToDoEditView: View {
    @EnvironmentObject var storage: ToDoStorage
    @Environment(\.presentationMode) private var presentationMode
    
    var toDoItem: ToDoModel
    @State private var text: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField(toDoItem.task, text: $text)
                    .navigationTitle("Edit")
                    .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("닫기")
                    }), trailing: Button(action: {
                        self.update()
                    }, label: {
                        Text("변경")
                    }))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
            }
            .onAppear {
                self.text = toDoItem.task
            }
        }
    }
    
    private func update() {
        storage.updateToDoTask(id: toDoItem.id, task: text)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct ToDoEditView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoEditView(toDoItem: ToDoModel.mock()[0])
    }
}
