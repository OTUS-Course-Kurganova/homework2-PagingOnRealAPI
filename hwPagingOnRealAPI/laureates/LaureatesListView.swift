//
//  LaureatesListView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 22.12.2022.
//

import SwiftUI

struct LaureatesListView: View {
    @EnvironmentObject var viewModel: LaureatesViewModel
    @EnvironmentObject var segmentedViewModel: SegmentedViewModel

    var body: some View {
        List {
            ForEach(viewModel.laureates) { laureate in
                let isLast = viewModel.laureates.isLast(laureate)
                Text(laureate.name)
                    .onAppear {
                        if isLast {
                            viewModel.getLaureates(category: segmentedViewModel.convertToCategory())
                        }
                    }
                    .modifier(ProgressBarModifier(withLoading: isLast && viewModel.isLoading))
            }
        }
    }
}

struct LaureatesListView_Previews: PreviewProvider {
    static var previews: some View {
        LaureatesListView()
            .environmentObject(LaureatesViewModel())
    }
}
