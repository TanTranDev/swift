import Foundation

protocol Repository {
    
    associatedtype T
    
    func get(completionHandler: (Error?) -> Void) -> [T]
    func add(_ item: T, completionHandler: (Error?) -> Void)
    func delete(_ index: IndexSet, completionHandler: (Error?) -> Void)
    func update(_ item: T, completionHandler: (Error?) -> Void)
}
