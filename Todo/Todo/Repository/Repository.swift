
import Foundation
import CoreData
import Combine

protocol Repository {
    func addToDo(_ toDo: ToDo) -> AnyPublisher<Void, Error>
    func updateToDo(_ toDo: ToDo) -> AnyPublisher<Void, Error>
    func deleteToDo(at indexSet: IndexSet) -> AnyPublisher<Void, Error>
    func loadToDos() -> AnyPublisher<Void, Error>
    func saveToDo() -> AnyPublisher<Void, Error>
}

final class TodoRepository: Repository, ObservableObject {
    
    @Published var toDos: [ToDo] = []
    
    let fileManager: FileManager
    
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName) {
            loadToDos()
        }
    }
    
    func addToDo(_ toDo: ToDo) -> AnyPublisher<Void, Error> {
        toDos.append(toDo)
        saveToDo()
    }
    
    func updateToDo(_ toDo: ToDo) -> AnyPublisher<Void, Error> {
        guard let index = toDos.firstIndex(where: { $0.id == toDo.id}) else { }
        toDos[index] = toDo
        saveToDo()
    }
    
    func deleteToDo(at indexSet: IndexSet) -> AnyPublisher<Void, Error> {
        toDos.remove(atOffsets: indexSet)
        self.saveToDo()
    }
    
    func loadToDos() -> AnyPublisher<Void, Error> {
        FileManager().readDocument(docName: fileName, completion: (Result<Data, Error>) -> Void).eraseToAnyPublisher() { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    toDos = try decoder.decode([ToDo].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveToDo() -> AnyPublisher<Void, Error> {
        print("save todo");
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(toDos)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}
