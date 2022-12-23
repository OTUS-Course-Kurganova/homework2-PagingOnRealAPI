//
//  LaureateBasicDataSource.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 22.12.2022.
//

import SwiftUI
import Network

final class LaureateBasicDataSource {
    fileprivate let unknown = "unknown"

    let name: String

    init(laureate: LaureateBasic) {
        name = laureate.name?.en ?? unknown
    }
}

extension LaureateBasicDataSource: Identifiable { }

