
import XCTest

class TodoUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
       
    }

    func testAddNewTodo() throws {
        let app = XCUIApplication()
        let AppNavigator = app.navigationBars["_TtGC7SwiftUI19UIHosting"]
        AppNavigator.buttons["Add"].tap()
        app.tables.textFields["ToDo"].tap()
        app.typeText("Abc")
        AppNavigator.buttons["save"].tap()
    }
    
    func testDeleteTodo() throws {
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.buttons["Abc"].swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
    }
}
