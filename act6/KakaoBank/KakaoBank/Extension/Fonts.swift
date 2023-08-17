//
//  Fonts.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import Foundation
import SwiftUI

extension Font {
    static func customFont(size: CGFloat, weight: Font.Weight) -> Font {
        return Font.system(size: size).weight(weight)
    }
}
// font-weight: 100; (Thin)
// font-weight: 200; (Extra Light)
// font-weight: 300; (Light)
// font-weight: 400; (Regular)
// font-weight: 500; (Medium)
// font-weight: 600; (Semi Bold)
// font-weight: 700; (Bold)
// font-weight: 800; (Extra Bold)
// font-weight: 900; (Black)

let kakaoHeadlineSemiBold = Font.customFont(size: 23, weight: .semibold)
let kakaoCapsuleSemiBold = Font.customFont(size: 13, weight: .semibold)

let kakaoCaptionMedium = Font.customFont(size: 14, weight: .medium)
let kakaoCaptionSemiBold = Font.customFont(size: 14, weight: .semibold)
let kakaoCaptionRegular = Font.customFont(size: 14, weight: .regular)

let kakaoMoneyBold = Font.customFont(size: 19, weight: .bold)
let kakaoMoneyBigBold = Font.customFont(size: 35, weight: .bold)
let kakaoMoneySemiBold = Font.customFont(size: 16, weight: .semibold)

let kakaoNameSemiBold = Font.customFont(size: 14, weight: .regular)
