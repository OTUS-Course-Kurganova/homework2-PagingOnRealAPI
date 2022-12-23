//
//  ProgressBarModifier.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 23.12.2022.
//

import SwiftUI

struct ProgressBarModifier: ViewModifier {
    let withLoading: Bool

    func body(content: Content) -> some View {
        if withLoading {
            VStack(alignment: .leading) {
                content
                Divider()
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                }
            }
        } else {
            content
        }
    }
}
