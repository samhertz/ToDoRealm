//
//  NavigationBarButtonViews.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/11/22.
//

import SwiftUI

struct NavigationBarButtonViews: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var text: String
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        Button {
            viewModel.addTask(taskTitle: text)
            dismiss()
        } label: {
            Text("Save")
                .padding(Project.Constants.paddingSmall)
                .disabled(text.isEmpty)
        }
    }
}

struct NavigationBarButtons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarButtonViews(text: .constant(""), viewModel: TaskViewModel())
    }
}
