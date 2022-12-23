//
//  LaureatesViewModel.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 21.12.2022.
//

import SwiftUI
import Network

enum ScienceCategory: String {
    case chemisrty = "Химии"
    case medicine = "Медицины"
}

final class LaureatesViewModel: ObservableObject {
    @Published var laureates: [LaureateDataSource] = []

    private let limit = 25
    var isLoading = false

    func getLaureates(category: ScienceCategory) {
        let modelCategory = convertCategories(category: category)
        fetchLaureates(category: modelCategory)
    }

    fileprivate func convertCategories(category: ScienceCategory) -> DefaultAPI.NobelPrizeCategory_laureatesGet {
        switch category {
            case .chemisrty: return .che
            case .medicine: return .med
        }
    }

    fileprivate func fetchLaureates(category: DefaultAPI.NobelPrizeCategory_laureatesGet) {
        isLoading = true
        DefaultAPI.laureatesGet(offset: laureates.count, limit: limit, nobelPrizeCategory: category) { [weak self] data, error in
            guard let self = self, let data = data, let laureates = data.laureates else { return }
            laureates.forEach {
                self.laureates.append(.init(laureate: $0))
            }
        }
    }
}
