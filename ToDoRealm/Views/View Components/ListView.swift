//
//  ListView.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/11/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    @Binding var completed: Bool
    
    var body: some View {
        List {
            ForEach(viewModel.tasks.filter { $0.completed == completed }, id: \.id) { task in
                if !task.isInvalidated {
                    NavigationLink {
                        EditTaskView(viewModel: viewModel, task: task)
                    } label: {
                        TaskRowView(task: task)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        swipeActionCompletion(task: task)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        swipeActionDeletion(task: task)
                    }
                }
            }
        }
        .accentColor(Project.Colors.screenBackgroundColor)
        .listStyle(.inset)
    }
    
    func swipeActionCompletion(task: TaskObjectModel) -> some View {
        Button {
            viewModel.updateTask(id: task.id, title: task.title, completed: !task.completed, date: Date())
        } label: {
            Text(task.completed ? "Undo Completion" : "Complete")
        }
        .tint(task.completed ? .gray: .green)
    }
    
    func swipeActionDeletion(task: TaskObjectModel) -> some View {
        Button {
            viewModel.deleteTask(id: task.id)
        } label: {
            Image(systemName: "trash")
        }
        .tint(.red)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: TaskViewModel(), completed: .constant(false))
    }
}
