//
//  TabModel.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/08.
//

import Foundation

struct TabModel: Identifiable,Hashable {
    var id = UUID()
    var tabName: String
    var width: CGFloat = 0
    var minX: CGFloat = 0
}

var tab: [TabModel] = [
    .init(tabName: "월"),
    .init(tabName: "화"),
    .init(tabName: "수"),
    .init(tabName: "목"),
    .init(tabName: "금"),
    .init(tabName: "토"),
    .init(tabName: "일"),
    .init(tabName: "신작"),
    
]
