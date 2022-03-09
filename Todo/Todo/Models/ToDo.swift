
import Foundation

struct ToDo: Identifiable, Codable, Equatable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
}
