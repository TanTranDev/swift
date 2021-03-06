
import SwiftUI

enum ModelType: Identifiable, View {
    case new
    case update(ToDo)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return EditAddTodoView(formVM: ToDoFormViewModel())
        case .update(let toDo):
            return EditAddTodoView(formVM: ToDoFormViewModel(toDo))
        }
    }
}
