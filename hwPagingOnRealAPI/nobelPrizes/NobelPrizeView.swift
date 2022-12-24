//
//  NobelPrizeView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 24.12.2022.
//

import SwiftUI

struct NobelPrizeView: View {
    @EnvironmentObject private var navigation: NavigationViewModel
    @State var laureate: LaureateDataSource

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Divider()
            comeBack
            Divider()
            comeBackToRoot
        }
    }

    fileprivate var comeBack: some View {
        Button {
            navigation.pop()
        } label: {
            Text("Назад")
                .fontWeight(.bold)
                .foregroundColor(.secondary)
                .font(.system(size: 14))
        }
        .padding(.top, 50)
    }
    
    fileprivate var comeBackToRoot: some View {
        Button {
            navigation.pop(destination: .poptoRoot)
        } label: {
            Text("Назад к списку лауреатов")
                .fontWeight(.bold)
                .foregroundColor(.secondary)
                .font(.system(size: 14))
        }
    }
}

struct NobelPrizeView_Previews: PreviewProvider {
    static var previews: some View {
        NobelPrizeView(laureate: .init(laureate: .init(id: "1")))
    }
}
