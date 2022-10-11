//
//  ToDoRealmApp.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/6/22.
//

import SwiftUI

@main
struct ToDoRealmApp: App {
    
    init() {
        // Segmented Control Appearance Adjustments for Entire App
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Project.Colors.buttonStrokeColor.opacity(0.5))], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Project.Colors.buttonStrokeColor)], for: .selected)
        
        // Navigation Title Appearance Adjustment for Entire App
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Project.Colors.textColor)]
        
        // TextEditor Control Appearance Adjustments for Entire App
        UITextView.appearance().backgroundColor = .clear
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
        
        // List Appearance Adjustments for Entire App
        UITableView.appearance().backgroundColor = UIColor(Project.Colors.screenBackgroundColor)
        UITableViewCell.appearance().backgroundColor = UIColor(Project.Colors.screenBackgroundColor)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TasksView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
