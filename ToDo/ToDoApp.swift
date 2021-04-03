//
//  ToDoApp.swift
//  ToDo
//
//  Created by Kanz on 2021/03/29.
//

import SwiftUI

@main
struct ToDoApp: App {
    @StateObject private var storage = ToDoStorage()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(storage)
                .onAppear {
                    storage.fetch()
                }
        }
    }
}

