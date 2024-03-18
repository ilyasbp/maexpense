//
//  MaexpenseUITests.swift
//  MaexpenseUITests
//
//  Created by Ilyas Bintang Prayogi on 17/03/24.
//

import XCTest
import DGCharts

final class MaexpenseUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let lineChart1DatasetDatasetElement = app.otherElements["Line Chart. 1 dataset. DataSet"]
        XCTAssertTrue(lineChart1DatasetDatasetElement.exists, "Linechart tidak tampil")
        lineChart1DatasetDatasetElement.tap()
        
        let element = app.otherElements[". 4 Elements"]
        XCTAssertTrue(element.exists, "Piechart tidak tampil")
        element.tap()
        
        let leftButton = app.buttons["Left"]
        XCTAssertTrue(leftButton.exists, "Back button tidak tampil")
        leftButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
