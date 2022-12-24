//
//  NavigationStack.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 24.12.2022.
//

import Foundation

struct NavigationStack {
    var screens: [Screen] = []

    func top() -> Screen? {
        screens.last
    }

    mutating func push(newScreen: Screen) {
        screens.append(newScreen)
    }

    mutating func popPrev() {
        _ = screens.popLast ()
    }

    mutating func popToRoot() {
        screens.removeAll()
    }
}
