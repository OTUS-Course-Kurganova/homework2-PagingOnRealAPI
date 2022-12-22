//
//  ContentView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 21.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: LaureatesViewModel

    var body: some View {
        List {
            ForEach(viewModel.laureates) { laureate in
                Text(laureate.name)
            }
        }
        .onAppear { viewModel.getLaureates() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
