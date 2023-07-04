//
//  ContentModel.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/07/03.
//

import Foundation

struct ContentModel: Identifiable {
    let id = UUID()
    let imageName: String
    let descriptionTitle: String
    let descriptionSubTitle: String
}
struct GradientContentModel: Identifiable {
    let id = UUID()
    let imageName: String
    let descriptionTitle: String
    let descriptionSubTitle: String
}
