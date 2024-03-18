//
//  DetailScreenTests.swift
//  MaexpenseTests
//
//  Created by Ilyas Bintang Prayogi on 18/03/24.
//

import XCTest
@testable import Maexpense

final class DetailScreenTests: XCTestCase {
    
    var detailScreen: DetailViewController!

    override func setUpWithError() throws {
        let monthDetailDatum = [MonthDetailDatum(trxDate: "21/03/2023", nominal: 50000),
                                MonthDetailDatum(trxDate: "22/03/2023", nominal: 20000)]
        let monthPortoDatum = MonthPortoDatum(label: "Jajan", percentage: "64", data: monthDetailDatum)
        detailScreen = DetailWireframe(monthData: monthPortoDatum).viewController
    }

    override func tearDownWithError() throws {
        detailScreen = nil
    }
    
    func testDetailData(){
        detailScreen.loadViewIfNeeded()
        
        // Check transaction type
        XCTAssertEqual(detailScreen.lb_expensetype.text, "Jajan")
        
        // Check percentage
        XCTAssertEqual(detailScreen.lb_percentage.text, "64%")
        
        // Check total expense
        XCTAssertEqual(detailScreen.lb_totalexpense.text, MoneyUtils.toRupiah(70000))
        
        // Check data source not nil
        XCTAssertNotNil(detailScreen.cv_transactionlist.dataSource)

        // Check data count
        let numberOfItems = detailScreen.cv_transactionlist.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItems, 2)
    }
}
