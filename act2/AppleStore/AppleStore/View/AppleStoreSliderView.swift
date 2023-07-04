//
//  AppleStoreSliderView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreSliderView: View {

    var indicator = UIPageControl.appearance()
    
    let slides : [SlideModel] = [
        .init(title: "무료배송", subTitle: "집으로 배송 받으세요. 아니면 Apple Store에서 재고\n제품을 픽업하세요.", imageName: "shippingbox",fontSize: 36),
        .init(title: "Apple Trade In", subTitle: "iPhone 8 이후 모델을 보상 판매하면 iPhone 14\n또는 iPhone 14 Pro 구입 시 사용할 수 있는 ₩40,000 ~\n₩780,000 상당의 크레딧이.*", imageName: "macbook.and.iphone",fontSize: 31),
        .init(title: "Airpod Pro", subTitle: "에어팟 프로를 잃어버렸습니다.\n제발 제 에어팟 프로를 찾아주세요.\n찾아주신 분에겐 ₩20,000 상당의 크레딧이.*", imageName: "airpodspro.chargingcase.wireless",fontSize: 31)
    ]
    
    var body: some View {
    
        
            TabView {
                ForEach(slides) { slide in
                    VStack {
                        HStack(alignment: .top,spacing: 0){
                            Image(systemName: slide.imageName)
                                .font(.system(size: slide.fontSize))
                                .padding(.trailing,12)
                                .padding(.leading,20)
                            
                            VStack(alignment: .leading,spacing:0){
                                Text(slide.title)
                                    .font(.system(size: 13))
                                    .fontWeight(.bold)
                                    .padding(.bottom,4)
                                    
                                Text(slide.subTitle)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .padding(.bottom,4)
                                    .padding(.trailing,20)
                                    .frame(maxWidth: .infinity,alignment:.leading)
                                    
                                    
                                Text("더 알아보기")
                                    .foregroundColor(Color("AppleStoreBlueColor"))
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    
                            }
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                }
            }
            .frame(height: 138)
            .tabViewStyle(.page)
            .onAppear { 
                indicator.currentPageIndicatorTintColor = .black
                indicator.pageIndicatorTintColor = .gray
        }
            

        
    }
}

struct AppleStoreSliderView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreSliderView()
    }
}
