//
//  NavigationViewModel.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 24.12.2022.
//

import SwiftUI

final class NavigationViewModel: ObservableObject {
    private let easing: Animation

    var navigationType: NavigationType = .push

    @Published var currentScreen: Screen?

    var screensStack = NavigationStack() {
        didSet {
            currentScreen = screensStack.top()
        }
    }

    init(easing: Animation) {
        self.easing = easing
    }

    func push<S: View>(newView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, screenView: AnyView(newView))
            screensStack.push(newScreen: screen)
        }
    }

    func pop(destination: PopDestination = .prevPop) {
        withAnimation(easing) {
            switch destination {
            case .prevPop:
                navigationType = .pop
                screensStack.popPrev()
            case .poptoRoot:
                navigationType = .pop
                screensStack.popToRoot()
            }
        }
    }
}
