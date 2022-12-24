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
    @EnvironmentObject var navigation: NavigationViewModel

    var body: some View {
        List {
            ForEach(viewModel.laureates) { laureate in
                contentCell(laureate: laureate, isLast: viewModel.laureates.isLast(laureate))
            }
        }
    }

    fileprivate func fillContentCell(laureate: LaureateDataSource, isLast: Bool) -> some View {
        Button {
            navigation.push(newView: LaureateView(laureate: laureate))
        } label: {
            Text(laureate.name)
                .foregroundColor(.black)
        }
    }

    fileprivate func contentCell(laureate: LaureateDataSource, isLast: Bool) -> some View {
        fillContentCell(laureate: laureate, isLast: isLast)
            .onAppear {
                if isLast {
                    viewModel.getLaureates(category: segmentedViewModel.convertToCategory())
                }
            }
            .modifier(ProgressBarModifier(withLoading: isLast && viewModel.isLoading))
    }
}

struct LaureatesListView_Previews: PreviewProvider {
    static var previews: some View {
        LaureatesListView()
    }
}
