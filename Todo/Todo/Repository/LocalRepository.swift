
import Foundation

struct LocalRepository: Repository {
    typealias T = ToDo
    let fileManager = FileManager()
    
    func get(completionHandler: (Error?) -> Void) -> [ToDo] {
        var toDos: [ToDo] = []
        fileManager.readDocument(docName: fileName) { (result) in
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
        print("get todo")
        return toDos
    }
    func add(_ item: T, completionHandler: (Error?) -> Void) {
        var toDos: [ToDo] = self.get { (error) in
            if let error = error {
                    print(error)
            }
        }
        toDos.append(item)
        self.save(toDos)
        
    }
    func delete(_ index: IndexSet, completionHandler: (Error?) -> Void) {
        var toDos: [ToDo] = self.get { (error) in
            if let error = error {
                    print(error)
            }
        }
        toDos.remove(atOffsets: index)
        self.save(toDos)
    }
    func update(_ item: T, completionHandler: (Error?) -> Void) {
        var toDos: [ToDo] = self.get { (error) in
            if let error = error {
                    print(error)
            }
        }
        guard let index = toDos.firstIndex(where: { $0.id == item.id}) else { return }
                toDos[index] = item
        self.save(toDos)
    }
    func save(_ items: [T]?) {
        print("save todo");
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(items)
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

