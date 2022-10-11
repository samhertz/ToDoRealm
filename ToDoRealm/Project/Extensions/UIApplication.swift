//
//  UIApplication.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/11/22.
//

import Foundation

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
