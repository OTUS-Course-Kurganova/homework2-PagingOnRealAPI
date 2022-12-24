//
//  LaureateView.swift
//  hwPagingOnRealAPI
//
//  Created by Sasha Kurganova on 22.12.2022.
//

import Foundation
import SwiftUI
import Network

struct LaureateView: View {
    @EnvironmentObject private var navigation: NavigationViewModel
    @State var laureate: LaureateDataSource

    var body: some View {
        VStack {
            configureTitle(laureate.name)
                .padding(.bottom, 30)
            Divider()
            sectionsInfo
            Divider()
            nobelPrize
                .padding(.top, 50)
            comeBack
        }
    }
    
    fileprivate func configureTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 25))
            .fontWeight(.bold)
            .foregroundColor(.orange)
    }
    
    fileprivate var sectionsInfo: some View {
        Group {
            configureSectionInfo(title: "Пол: ", info: laureate.gender)
            configureSectionInfo(title: "Дата рождения: ", info: laureate.birthDate)
            configureSectionInfo(title: "Место рождения: ", info: laureate.birthCountry)
            configureSectionInfo(title: "Дата смерти: ", info: laureate.deathDate)
            configureSectionInfo(title: "Место смерти: ", info: laureate.deathCountry)
        }
    }

    fileprivate func configureSectionInfo(title: String, info: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .fixedSize(horizontal: false, vertical: true)
            Text(info)
                .font(.system(size: 16))
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    fileprivate var nobelPrize: some View {
        Button {
            navigation.push(newView: NobelPrizeView(laureate: laureate))
        } label: {
            Text("Просмотреть информацию о нобелевских премиях")
                .foregroundColor(.teal)
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
}

struct LaureateView_Previews: PreviewProvider {
    static var previews: some View {
        LaureateView(laureate: .init(laureate: .init(id: "1")))
    }
}

