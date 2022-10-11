//
//  ContentView.swift
//  ToDoRealm
//
//  Created by Samuel Hertz on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realmManager)

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
