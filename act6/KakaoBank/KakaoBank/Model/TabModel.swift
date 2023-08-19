//
//  TabModel.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/16.
//

import Foundation

struct Tab: Identifiable,Hashable{
    let id = UUID()
    let name: String
    var image: String
    let subName: String
}
