//
//  Screen.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 24.12.2022.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    let id: String
    let screenView: AnyView

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
