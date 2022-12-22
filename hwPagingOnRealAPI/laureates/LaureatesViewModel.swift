//
//  LaureatesViewModel.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 21.12.2022.
//

import SwiftUI
import Network

final class LaureatesViewModel: ObservableObject {
    @Published var laureates: [LaureateDataSource] = []

    func getLaureates() {
        fetchLaureantes()
    }

    fileprivate func fetchLaureantes() {
        DefaultAPI.laureatesGet { [weak self] data, error in
            guard let self = self, let data = data, let laureates = data.laureates else { return }
            laureates.forEach {
                self.laureates.append(.init(person: $0))
            }
        }
    }
}
