//
//  AddButton.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Image(systemName: "plus.circle")
        }
        .frame(height: 20)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
