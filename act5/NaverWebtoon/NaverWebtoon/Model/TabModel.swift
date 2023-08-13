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
    var viewName: String
    var width: CGFloat = 0
    var minX: CGFloat = 0
}

var tab: [TabModel] = [
    .init(tabName: "월", viewName: "MondayView"),
    .init(tabName: "화", viewName: "TuesdayView"),
    .init(tabName: "수", viewName: "WednesdayView"),
    .init(tabName: "목", viewName: "ThursdayView"),
    .init(tabName: "금", viewName: "FridayView"),
    .init(tabName: "토", viewName: "SaturdayView"),
    .init(tabName: "일", viewName: "SundayView"),
    .init(tabName: "신작", viewName: "NewdayView"),
]
