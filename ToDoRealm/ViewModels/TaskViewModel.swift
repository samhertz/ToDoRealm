//
//  RealmManager.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/10/22.
//

import Foundation
import RealmSwift

class TaskViewModel: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [TaskObjectModel] = []
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let configuration = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = configuration
            localRealm = try Realm()
            getTasks()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    // MARK: CRUD Functions
    
    // Create
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write{
                    let newTask = TaskObjectModel(value: ["title": taskTitle, "completed": false, "date": Date()])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm: \(newTask)")
                }
            } catch {
                print("Error adding task to realm: \(error)")
            }
        }
    }
    
    // Read
    func getTasks() {
        if let localRealm = localRealm {
            // Sorted by date - Oldest -> Newest
            let allTasks = localRealm.objects(TaskObjectModel.self).sorted(byKeyPath: "date")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    // Update
    func updateTask(id: ObjectId, title: String, completed: Bool, date: Date) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(TaskObjectModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    taskToUpdate[0].date = date
                    taskToUpdate[0].title = title
                    getTasks()
                    print("Updated task id: \(id) with completion status: \(completed). Updated Date: \(date.dayAndTimeText)")
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
    // Delete
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(TaskObjectModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else { return }
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Deleted task with id: \(id)")
                }
            } catch {
                print("Error deleting task \(id) from Realm: \(error)")
            }
        }
    }
}
