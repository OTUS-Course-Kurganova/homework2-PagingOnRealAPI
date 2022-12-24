//
//  SegmentedView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 22.12.2022.
//

import SwiftUI

struct SegmentedView: View {
    @EnvironmentObject var viewModel: SegmentedViewModel
    @EnvironmentObject var laureatesViewModel: LaureatesViewModel

    var body: some View {
        VStack {
            pickerView
            let laureates = LaureatesListView()
            if viewModel.selectedSegment == 0 {
                get(laureates: laureates)
            } else if viewModel.selectedSegment == 1 {
                get(laureates: laureates)
            }
        }
    }

    fileprivate var pickerView: some View {
        Picker("Область науки:", selection: $viewModel.selectedSegment) {
            Text("\(ScienceCategory.chemistry.rawValue)")
                .tag(0)
            Text("\(ScienceCategory.medicine.rawValue)")
                .tag(1)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.teal)
    }

    fileprivate func get(laureates: LaureatesListView) -> some View {
        laureates
            .onAppear {
                laureatesViewModel.getLaureates(category: viewModel.convertToCategory())
            }
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
