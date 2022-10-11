//
//  TaskObjectModel.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import Foundation
import RealmSwift

class TaskObjectModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
    @Persisted var date: Date = Date()
}
