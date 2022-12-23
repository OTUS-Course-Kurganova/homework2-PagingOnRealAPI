//
//  SegmentedView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 22.12.2022.
//

import SwiftUI

struct SegmentedView: View {
    @EnvironmentObject var viewModel: SegmentedViewModel

    var body: some View {
        Picker("Область науки:", selection: $viewModel.selectedSegment) {
            Text("\(ScienceCategory.chemisrty.rawValue)")
                .tag(0)
            Text("\(ScienceCategory.medicine.rawValue)")
                .tag(1)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.teal)
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
            .environmentObject(SegmentedViewModel())
    }
}

