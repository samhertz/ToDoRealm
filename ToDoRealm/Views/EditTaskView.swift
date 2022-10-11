//
//  EditTaskView.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct EditTaskView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    private var task: TaskObjectModel
    @State private var text: String = ""
    @State private var editable: Bool = false
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: TaskViewModel, task: TaskObjectModel) {
        self.viewModel = viewModel
        self.task = task
        self._text = State(initialValue: task.title)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TextEditorView(text: editable ? $text : .constant(text))
                .textSelection(.enabled)
                .allowsHitTesting(editable)
            
            Text("Last Updated: \(task.date.dayAndTimeText)")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
            .padding()
            .background(Project.Colors.screenBackgroundColor)
            .navigationTitle(editable ? "Update Task" : "View Task")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarCompleteButton
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarUpdateButton
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    navigationBarBackButton
                }
            }
    }
    
    private var navigationBarCompleteButton: some View {
        Button {
            viewModel.updateTask(id: task.id, title: task.title, completed: !task.completed, date: Date())
            dismiss()
        } label: {
            Text(editable ? "" : (task.completed ? "Undo Completion" : "Complete"))
                .padding(Project.Constants.paddingSmall)
                .foregroundColor(Project.Colors.textColor)
        }
        .disabled(editable == true)
    }
    
    private var navigationBarUpdateButton: some View {
        Button {
            if editable == true {
                viewModel.updateTask(id: task.id, title: text, completed: task.completed, date: Date())
            }
            editable.toggle()
        } label: {
            Text(editable ? "Update" : "Edit")
                .padding(Project.Constants.paddingSmall)
                .foregroundColor(Project.Colors.textColor)
        }
    }
    
    private var navigationBarBackButton: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundColor(Project.Colors.textColor)
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditTaskView(viewModel: TaskViewModel(), task: dev.task)
        }
    }
}
