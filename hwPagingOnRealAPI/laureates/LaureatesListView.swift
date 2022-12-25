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

    @State var isRotating = 0.0

    var body: some View {
        if viewModel.laureates.isEmpty && viewModel.isLoading { loader }
        List {
            ForEach(viewModel.laureates) { laureate in
                contentCell(laureate: laureate, isLast: viewModel.laureates.isLast(laureate))
                    .rotationEffect(.degrees(isRotating))
                    .animation(.linear(duration: 1), value: isRotating)
            }
        }
    }

    private var loader: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .padding(.top, 100)
    }

    fileprivate func fillContentCell(laureate: LaureateDataSource, isLast: Bool) -> some View {
        Button {
            withAnimation {
                isRotating += 200
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                navigation.push(newView: LaureateView(laureate: laureate))
            }
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
