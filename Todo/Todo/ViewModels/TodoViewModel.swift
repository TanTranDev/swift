
import Foundation

class TodoViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []

    let localRepository: LocalRepository = LocalRepository()
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName) {
            loadToDos()
        }
    }
    
    func addToDo(_ toDo: ToDo) {
        localRepository.add(toDo) {
            (error) in
                if let error = error {
                        print(error)
                }
            }
        loadToDos()
    }

    
    func updateToDo(_ toDo: ToDo) {
        localRepository.update(toDo) {
            (error) in
                if let error = error {
                        print(error)
                }
            }
        loadToDos()
    }
    
    func deleteToDo(at indexSet: IndexSet) {
        localRepository.delete(indexSet) {
            (error) in
                if let error = error {
                        print(error)
                }
            }
        loadToDos()
    }
    
    func loadToDos() {
        toDos = localRepository.get { (error) in
            if let error = error {
                    print(error)
            }
        }
    }
}
