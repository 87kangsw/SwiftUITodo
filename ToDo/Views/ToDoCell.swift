//
//  ToDoCell.swift
//  ToDo
//
//  Created by Kanz on 2021/04/01.
//

import SwiftUI

/// 할일 항목
struct ToDoCell: View {
    let todoItem: ToDoModel
    
    let checkButtonTapped: () -> Void
    let editButtonTapped: () -> Void
    let deleteButtonTapped: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                self.checkButtonTapped()
            }) {
                if todoItem.isCompleted == true {
                    Image(systemName: "checkmark.square")
                } else {
                    Image(systemName: "square")
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding(8.0)
            
            if todoItem.isCompleted == true {
                Text(todoItem.task)
                    .font(.title2)
                    .strikethrough()
            } else {
                Text(todoItem.task)
                    .font(.title2)
            }
            
            Spacer()
            
            Button(action: {
                self.editButtonTapped()
            }) {
                Image(systemName: "pencil")
            }
            .buttonStyle(PlainButtonStyle())
            .padding(8.0)
            
            Button(action: {
                self.deleteButtonTapped()
            }) {
                Image(systemName: "trash")
            }
            .buttonStyle(PlainButtonStyle())
            .padding(8.0)
        }
    }
}

struct ToDoCell_Previews: PreviewProvider {
    static var previews: some View {
        ToDoCell(todoItem: ToDoModel.mock()[0],
                 checkButtonTapped: {},
                 editButtonTapped: {},
                 deleteButtonTapped: {})
            .previewLayout(.sizeThatFits)
    }
}
