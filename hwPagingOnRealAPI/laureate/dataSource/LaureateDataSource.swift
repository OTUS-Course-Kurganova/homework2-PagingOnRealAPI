//
//  LaureateDataSource.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 21.12.2022.
//

import SwiftUI
import Network

final class LaureateDataSource {
    fileprivate let unknown = "unknown"

    let name: String
    let gender: String
    let birthDate: String
    let deathDate: String
    let birthCountry: String
    let deathCountry: String
    let nobelPrizes: [NobelPrizeDataSource]

    init(laureate: Laureate) {
        name = laureate.fullName?.en ?? unknown
        gender = laureate.gender?.rawValue ?? unknown
        birthDate = laureate.birth?.date ?? unknown
        deathDate = laureate.death?.date ?? unknown
        birthCountry = laureate.birth?.place?.country?.en ?? unknown
        deathCountry = laureate.death?.place?.country?.en ?? unknown
        nobelPrizes = laureate.nobelPrizes?.map { NobelPrizeDataSource(prize: $0) } ?? []
    }
}

extension LaureateDataSource: Identifiable { }
