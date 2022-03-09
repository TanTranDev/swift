//
//  ToDoFormView.swift
//  Todo
//
//  Created by Tran Nhat Tan on 20/02/2022.
//

import SwiftUI

struct EditAddTodoView: View {
    @EnvironmentObject var TodoFormViewModel: TodoViewModel
    @ObservedObject var formVM: ToDoFormViewModel
    @Environment(\.presentationMode)  var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    TextField("ToDo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Todo").font(.largeTitle).foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    cancelButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    updateSaveButton
                }
            }
        }
    }
}

extension EditAddTodoView {
    func updateToDo() {
        let toDo = ToDo(id: formVM.id!, name: formVM.name, completed: formVM.completed)
        TodoFormViewModel.updateToDo(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addToDo() {
        let toDo = ToDo(name: formVM.name)
        TodoFormViewModel.addToDo(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button( formVM.updating ? "update" : "save", action: formVM.updating ? updateToDo : addToDo).disabled(formVM.isDisable)
    }
}

struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        EditAddTodoView(formVM: ToDoFormViewModel()).environmentObject(TodoViewModel())
    }
}
