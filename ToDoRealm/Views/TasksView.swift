//
//  TasksView.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct TasksView: View {
    
    @ObservedObject var viewModel = TaskViewModel()
    @State var completed: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            CompletionPickerView(completed: $completed)

            ListView(viewModel: viewModel, completed: $completed)
        }
        .background(Project.Colors.screenBackgroundColor)
        .navigationTitle("TODO LIST")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarAddTaskButton
            }
        }
    }
    
    private var navigationBarAddTaskButton: some View {
        NavigationLink {
            AddTaskView(viewModel: viewModel)
        } label: {
            Image(systemName: "plus.circle")
                .padding()
                .foregroundColor(Project.Colors.textColor)
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TasksView()
        }
    }
}
