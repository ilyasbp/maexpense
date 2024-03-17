//
//  Portofolio.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 17/03/24.
//

import Foundation

// MARK: - Portofolio
struct Portofolio: Codable {
    var monthPorto: MonthPorto?
    var yearPorto: YearPorto?
}

// MARK: - MonthPorto
struct MonthPorto: Codable {
    var type: String?
    var data: [MonthPortoDatum]?
}

// MARK: - MonthPortoDatum
struct MonthPortoDatum: Codable {
    var label, percentage: String?
    var data: [MonthDetailDatum]?
}

// MARK: - DatumDatum
struct MonthDetailDatum: Codable {
    var trxDate: String?
    var nominal: Int?

    enum CodingKeys: String, CodingKey {
        case trxDate = "trx_date"
        case nominal
    }
}

// MARK: - YearPorto
struct YearPorto: Codable {
    var type: String?
    var data: YearPortoDatum?
}

// MARK: - DataClass
struct YearPortoDatum: Codable {
    var month: [Int]?
}
