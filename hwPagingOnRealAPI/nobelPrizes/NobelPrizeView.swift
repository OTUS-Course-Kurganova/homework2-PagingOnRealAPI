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
        ScrollView {
            VStack {
                configureTitle(laureate.name)
                    .padding(.top, 20)
                Divider()
                ForEach(laureate.nobelPrizes) { prize in
                    configureSectionsInfo(prize: prize)
                }
                configureBackStack()
            }
        }
    }
    
    fileprivate func configureTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 25))
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .padding(.bottom, 30)
            .multilineTextAlignment(.center)
    }
    
    fileprivate func configureSectionsInfo(prize: NobelPrizeDataSource) -> some View {
        Group {
            configureSectionInfo(title: "Категория: ", info: prize.category)
            configureSectionInfo(title: "Год выигрыша: ", info: prize.awardYear)
            configureSectionInfo(title: "Сумма выигрыша: ", info: prize.amount.formatted())
            configureSectionInfo(title: "Статус: ", info: prize.status.rawValue)
            configureSectionInfo(title: "Мотивационная речь: ", info: prize.motivation)
            Divider()
                .padding(.top, 15)
                .padding(.bottom, 15)
        }
    }

    fileprivate func configureSectionInfo(title: String, info: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 15)
            Text(info)
                .font(.system(size: 16))
                .multilineTextAlignment(.leading)
                .padding(.trailing, 15)
        }
    }
    
    fileprivate func configureBackStack() -> some View {
        Group {
            comeBack
                .padding(.bottom, 10)
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
