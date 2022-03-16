
import XCTest

@testable import Todo


class TodoTests: XCTestCase {
    var todo: TodoViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        todo = TodoViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        todo = nil
    }
    
    override func setUp() {
        todo.localRepository.save([])
     }
    
    override func tearDown() {
        todo.localRepository.save([])
     }
    
    func testTodoViewModelAdd() {
        // given
        let item = ToDo(id: "1", name: "dummy", completed: true)
        // when
        todo.addToDo(item)
        // then
        let actual = todo.toDos
        XCTAssertEqual(actual, [item])
    }
    
    func testTodoViewModelUpdate() {
        // given
        let item = ToDo(id: "1", name: "dummy", completed: true)
        let updateItem = ToDo(id: "1", name: "dummy", completed: false)
        todo.addToDo(item)
        // when
        todo.updateToDo(updateItem)
        // then
        let actual = todo.toDos
        XCTAssertEqual(actual, [updateItem])
    }
    
    func testTodoViewModelDelete() {
        // given
        let item = ToDo(id: "1", name: "dummy", completed: true)
        todo.addToDo(item)
        // when
        let index = IndexSet([0])
        todo.deleteToDo(at: index)
        // then
        let actual = todo.toDos
        XCTAssertEqual(actual, [])
    }
}
