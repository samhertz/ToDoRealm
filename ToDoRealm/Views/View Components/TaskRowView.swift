//
//  TaskRow.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: TaskObjectModel
    
    var body: some View {
        HStack(spacing: Project.Constants.spacing) {
            Image(systemName: task.completed ? "checkmark.circle" : "circle")
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.title3)
                    .lineLimit(3)
                Text(task.date.dayAndTimeText)
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .foregroundColor(Project.Colors.textColor)
    }
}

struct TaskRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TaskRowView(task: dev.task)
            TaskRowView(task: dev.task)
                .preferredColorScheme(.dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
