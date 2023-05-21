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

let slides : [SlideModel] = [
    .init(title: "무료배송", subTitle: "집으로 배송 받으세요. 아니면 Apple Store에서 재고\n제품을 픽업하세요.", imageName: "shippingbox",fontSize: 36),
    .init(title: "Apple Trade In", subTitle: "iPhone 8 이후 모델을 보상 판매하면 iPhone 14\n또는 iPhone 14 Pro 구입 시 사용할 수 있는 ₩40,000 ~\n₩780,000 상당의 크레딧이.*", imageName: "macbook.and.iphone",fontSize: 31),
    .init(title: "Airpod Pro", subTitle: "에어팟 프로를 잃어버렸습니다.\n제발 제 에어팟 프로를 찾아주세요.\n찾아주신 분에겐 ₩20,000 상당의 크레딧이.*", imageName: "airpodspro.chargingcase.wireless",fontSize: 31)
]

struct SwipeModel: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let imageName: String
    let textColor: Color
    let subTextColor: Color
}

let swipes : [SwipeModel] = [
    .init(title: "다채롭게 만개한\n어버이날 선물", subTitle: "쉽게 선물 쇼핑하기", imageName: "ImgSwipeProduct01",textColor: Color("ColorFontBlack"),subTextColor: Color("ColorFontBlack")),
    .init(title: "iPhone 14 Pro\n딥 퍼플", subTitle: "몽환적인 색감, 색다른 경험.", imageName: "ImgSwipeProduct02",textColor: Color("ColorFontWhite"),subTextColor: Color("ColorFontGray")),
    .init(title: "MacBook Pro 14\n및 16", subTitle: "이거 문구를 발견하고, 톡방에 메세지를\n먼저 보내는 사람은 페페의 선물이!", imageName: "ImgSwipeProduct03",textColor: Color("ColorFontWhite"),subTextColor: Color("ColorFontGray")),
]
