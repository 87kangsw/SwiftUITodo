//
//  Home.swift
//  ToDo
//
//  Created by Kanz on 2021/04/02.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var storage: ToDoStorage
    
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                HStack {
                    TextField("할 일을 등록해주세요.", text: $text) { changed in
                        self.isEditing = changed
                    } onCommit: {
                        print("onCommit")
                        self.createToDo()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    .padding(.horizontal, 20.0)
                    
                    if isEditing {
                        Button(action: {
                            self.endEditing()
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
                
                ToDoList()
            }
            .navigationTitle("To Do List")
        }
        .environmentObject(storage)
    }
    
    private func endEditing() {
        self.isEditing = false
        self.text = ""
        
        // Dismiss the keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
    
    private func createToDo() {
        defer { self.endEditing() }
        let model = ToDoModel(task: text, isCompleted: false)
        storage.addToDo(model)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ToDoStorage())
    }
}
