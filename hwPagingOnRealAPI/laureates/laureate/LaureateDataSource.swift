//
//  LaureateDataSource.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 21.12.2022.
//

import Foundation
import Network
import SwiftUI

final class LaureateDataSource {
    fileprivate let unknown = "unknown"

    let name: String
    let gender: String
    let birthDate: String
    let deathDate: String
    let birthCountry: String
    let deathCountry: String

    init(person: Laureate) {
        name = person.fullName?.en ?? unknown
        gender = person.gender?.rawValue ?? unknown
        birthDate = person.birth?.date ?? unknown
        deathDate = person.death?.date ?? unknown
        birthCountry = person.birth?.place?.country?.en ?? unknown
        deathCountry = person.death?.place?.country?.en ?? unknown
    }
}

extension LaureateDataSource: Identifiable { }
