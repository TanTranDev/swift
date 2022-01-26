//
//  TodoBasicApp.swift
//  TodoBasic
//
//  Created by Tran Nhat Tan on 24/01/2022.
//

import SwiftUI

@main
struct TodoBasicApp: App {
    
    @StateObject var listViewMode: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewMode)
            
        }
    }
}
