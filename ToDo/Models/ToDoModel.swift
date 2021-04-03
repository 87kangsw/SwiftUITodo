//
//  ToDoModel.swift
//  ToDo
//
//  Created by Kanz on 2021/04/02.
//

import Foundation

/// 할일 모델
struct ToDoModel: Identifiable, Hashable, Codable, Equatable {
    var id: UUID
    var task: String
    var isCompleted: Bool
    
    init(task: String, isCompleted: Bool) {
        self.id = UUID()
        self.task = task
        self.isCompleted = isCompleted
    }
}

extension ToDoModel {
    static func mock() -> [ToDoModel] {
        return [
            ToDoModel(task: "SwiftUI 공부", isCompleted: true),
            ToDoModel(task: "영어 단어", isCompleted: false),
            ToDoModel(task: "필라테스", isCompleted: true)
        ]
    }
}
