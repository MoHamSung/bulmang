//
//  AppleStoreModel.swift
//  clonecoding_practice
//
//  Created by 하명관 on 2023/05/17.
//

import SwiftUI

struct SlideModel: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let imageName: String
    let fontSize: Double
    
}



struct SwipeModel: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let imageName: String
    let textColor: Color
    let subTextColor: Color
}


