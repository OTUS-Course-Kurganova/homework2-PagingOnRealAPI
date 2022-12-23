//
//  NobelPrizeDataSource.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 22.12.2022.
//

import SwiftUI
import Network

final class NobelPrizeDataSource {
    fileprivate let unknown = "unknown"

    let category: String
    let awardYear: String
    var laureates: [LaureateBasicDataSource?]

    init(prize: NobelPrize) {
        category = prize.category?.en ?? unknown
        awardYear = prize.awardYear?.formatted() ?? unknown
        laureates = prize.laureates?.compactMap { LaureateBasicDataSource(laureate: $0) } ?? []
    }
}

extension NobelPrizeDataSource: Identifiable { }
