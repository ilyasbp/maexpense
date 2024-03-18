//
//  MainScreenTests.swift
//  MaexpenseTests
//
//  Created by Ilyas Bintang Prayogi on 18/03/24.
//

import XCTest
import DGCharts
@testable import Maexpense

final class MainScreenTests: XCTestCase {

    var mainScreen: ExpenseViewController!
    
    override func setUpWithError() throws {
        mainScreen = ExpenseWireframe().viewController
    }

    override func tearDownWithError() throws {
        mainScreen = nil
    }
    
    func testMonthlyPortofolio() throws {
        // Load mock data
        let mockPortfolioData = [MonthPortoDatum(label: "Tarik Tunai", percentage: "40"),
                                 MonthPortoDatum(label: "Topup Gopay", percentage: "30"),
                                 MonthPortoDatum(label: "QRIS Payment", percentage: "30")]
        mainScreen.loadViewIfNeeded()
        mainScreen.displayDonutChart(data: mockPortfolioData)
        
        // Check dataset count
        guard let dataSets = mainScreen.pcv_monthly.data else {
            XCTFail("Tidak ada dataset pada chart")
            return
        }
        XCTAssertEqual(dataSets.dataSetCount, 1)
        
        // Check first dataset
        guard let dataSet = dataSets.first as? PieChartDataSet else {
            XCTFail("Dataset tidak sesuai dengan tipe yang diharapkan")
            return
        }
        XCTAssertEqual(dataSet.count, 3)
        
        // Check first data entry
        guard let firstEntry = dataSet.entries.first as? PieChartDataEntry else {
            XCTFail("Tidak ada entri pada dataset")
            return
        }
        XCTAssertEqual(firstEntry.value, 40.0)
        XCTAssertEqual(firstEntry.label, "Tarik Tunai")
    }
    
    func testAnnuallyPortofolio() throws {
        // Load mock data
        let mockPortfolioData = [2,4,3,5,3,6,3,7,23,6,3,5]
        mainScreen.loadViewIfNeeded()
        mainScreen.displayLineChart(data: mockPortfolioData)
        
        // Check dataset count
        guard let dataSets = mainScreen.lcv_annually.data?.dataSets else {
            XCTFail("Tidak ada dataset pada chart")
            return
        }
        XCTAssertEqual(dataSets.count, 1)
        
        // Check first dataset
        guard let dataSet = dataSets.first else {
            XCTFail("Dataset tidak sesuai dengan tipe yang diharapkan")
            return
        }
        XCTAssertEqual(dataSet.entryCount, 12)
        
        // Check first data entry
        guard let firstEntry = dataSet.entryForIndex(0) else {
            XCTFail("Tidak ada entri pada dataset")
            return
        }
        XCTAssertEqual(firstEntry.y, 2)
    }
}
