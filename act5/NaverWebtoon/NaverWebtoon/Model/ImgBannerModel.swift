//
//  BannerModel.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/07.
//

import Foundation

//MARK: HEADER MODEL
struct ImgBannerModel: Identifiable {
    let id = UUID()
    let imgBanner: String
    let imgLinBanner: String
}
