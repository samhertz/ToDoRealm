//
//  AddTaskView.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    @State private var text: String = ""
    @Environment(\.dismiss) var dismiss
    @FocusState private var textEditorInFocus: Bool
    
    var body: some View {
        TextEditorView(text: $text)
            .focused($textEditorInFocus)
            .padding()
            .background(Project.Colors.screenBackgroundColor)
            .navigationTitle("Create a New Task")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarSaveButton
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    navigationBarBackButton
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    textEditorInFocus = true
                }
            }
    }
    
    private var navigationBarSaveButton: some View {
        Button {
            viewModel.addTask(taskTitle: text)
            dismiss()
        } label: {
            Text("Save")
                .padding(Project.Constants.paddingSmall)
                .disabled(text.isEmpty)
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

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView(viewModel: TaskViewModel())
        }
    }
}
