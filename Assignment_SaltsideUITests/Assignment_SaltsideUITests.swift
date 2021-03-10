//
//  Assignment_SaltsideUITests.swift
//  Assignment_SaltsideUITests
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import XCTest

class Assignment_SaltsideUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    ///check for table view existence and cells have the required values
    func testTableData() {
        let app = XCUIApplication()
        app.launch()
        let table = app.tables[AccessibilityIdentifiers.dataListTable]
        //wait for table view to load data from API
        waitForElementToAppear(table, file: #file, line: #line, elementName: "Data List Table", timeout: 10.0)
        //generate the list of cell values from hardcoded data provided and check if table view cells contain those data
        let identifiers = generateIdentifierList()
        identifiers.forEach { identifier in
          let cell = table.cells[identifier]
          XCTAssertTrue(cell.exists, "\(identifier) cell should be present")
        }
    }
    
    /// Test for cell details by tapping on the of the cells and matching its details which are shown inside
    func testCellDetail() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
        let table = app.tables[AccessibilityIdentifiers.dataListTable]
        waitForElementToAppear(table, file: #file, line: #line, elementName: "Data List Table", timeout: 10.0)
        //find the table view cell with title "zone initial" and tap on that cell asserting that the cell exists
        let identifier = "\(AccessibilityIdentifiers.dataCellPrefix) zone initial"
        let cell = table.cells[identifier]
        XCTAssertTrue(cell.exists, "\(identifier) cell should be present")
          
        cell.tap()
        //check the value in the title label should match the expected value
        let titleLabel = app.staticTexts[AccessibilityIdentifiers.dataDetailTitleLabel]
        XCTAssertEqual(titleLabel.label, "zone initial", "title label should title for data")
        //check the value in the description label should match the expected value
        let descriptionLabel = app.staticTexts[AccessibilityIdentifiers.dataDetailDescriptionLabel]
        XCTAssertEqual(descriptionLabel.label, "alarm hull wishes flesh surrender others street cliffs chain milestone audit agreement deployment", "Description label should match data description")
        //checking the back button tap if it is working correctly or not
        let backButton = app.buttons[AccessibilityIdentifiers.dataDetailBackButton]
        XCTAssertTrue(backButton.exists, "Back button should be present")
        backButton.tap()
        
        waitForElementToAppear(table, file: #file, line: #line, elementName: "Data List Table", timeout: 10.0)
    }
    
    /// Generating a list of 3 identifiers which are correct data and matching the cells contins those data or not
    /// - Returns: String array with respective data titles
    func generateIdentifierList() -> [String] {
      let titles = [
        "terminations map autos sons utilizations",
        "zone initial",
        "organs ropes"
      ]
      
      let identifiers = titles.map { title in
        return "\(AccessibilityIdentifiers.dataCellPrefix) \(title)"
      }
      
      return identifiers
    }
}
