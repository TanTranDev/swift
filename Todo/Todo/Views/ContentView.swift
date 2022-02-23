//
//  ContentView.swift
//  Todo
//
//  Created by Tran Nhat Tan on 20/02/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modelType: ModelType? = nil
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos) { toDo in
                    Button {
                        modelType = .update(toDo)
                    } label: {
                        Text(toDo.name).font(.title3).strikethrough(toDo.completed).foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }.onDelete(perform: dataStore.deleteToDo)
            }.listStyle(InsetGroupedListStyle())
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("List Todo").font(.largeTitle).foregroundColor(.blue)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            modelType = .new
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
        }
        .sheet(item: $modelType) { $0
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataStore())
    }
}
