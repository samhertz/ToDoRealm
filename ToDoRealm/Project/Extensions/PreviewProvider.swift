//
//  PreviewProvider.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let task = TaskObjectModel(value: ["title": "Preview Provider Example Task", "completed": false, "date": Date()])
}
