//
//  CompletionPickerView'.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct CompletionPickerView: View {
    
    @Binding var completed: Bool
    
    var body: some View {
        Picker(selection: $completed) {
            Text("Incomplete").tag(false)
            Text("Complete").tag(true)
        } label: {
            Text("Picker")
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(
            Project.Colors.buttonTextColor
                .cornerRadius(Project.Constants.roundedEdges)
        )
        .padding(.horizontal)
        .padding(.top)
        
    }
}

struct CompletionPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CompletionPickerView(completed: .constant(true))
    }
}
