//
//  NavigationCustomView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 24.12.2022.
//

import SwiftUI

struct NavigationCustomView<Content>: View where Content: View {
    @ObservedObject private var viewModel: NavigationViewModel

    var content: Content
    var transition: (push: AnyTransition, pop: AnyTransition)

    init(viewModel: NavigationViewModel = .init(easing: .easeOut(duration: 0.4)), transition: NavigationAnimationType,
         @ViewBuilder contentBuilder: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        
        switch transition {
            case .none:
                self.transition = (.identity, .identity)
            case .custom(let pushAnim, let popAnim):
                self.transition = (pushAnim, popAnim)
        }
    }

    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            switch isRoot {
                case true:
                    content
                        .environmentObject(viewModel)
                        .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
                case false:
                    viewModel.currentScreen!.screenView
                        .environmentObject(viewModel)
                        .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
