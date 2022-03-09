//
//  ContentView.swift
//  Todo
//
//  Created by Tran Nhat Tan on 20/02/2022.
//

import SwiftUI

struct ListTodoView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var modelType: ModelType? = nil
    var body: some View {
        NavigationView {
            List() {
                ForEach(todoViewModel.toDos) { toDo in
                    Button {
                        modelType = .update(toDo)
                    } label: {
                        Text(toDo.name).font(.title3).strikethrough(toDo.completed).foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }.onDelete(perform: todoViewModel.deleteToDo)
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

struct ListTodoView_Previews: PreviewProvider {
    static var previews: some View {
        ListTodoView().environmentObject(TodoViewModel())
    }
}
