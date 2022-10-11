//
//  TextEditor.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct TextEditorView: View {
    
    @Binding var text: String
        
    var body: some View {
        VStack(alignment: .leading) {
            TextEditor(text: $text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Project.Colors.textColor)
                .background(Project.Colors.textFieldColor)
                .cornerRadius(Project.Constants.roundedEdges)
                .padding(.bottom)
        }
    }
}

struct TextEditor_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(text: .constant("Text Example"))
    }
}
