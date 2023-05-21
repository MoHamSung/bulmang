//
//  AppleStoreMainView.swift
//  clonecoding_practice
//
//  Created by 하명관 on 2023/05/17.
//

import SwiftUI

struct AppleStoreMainView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack (alignment:.leading,spacing: 0) {

                        TopView
                            .padding(.horizontal,20)
                        
                        AppleStoreSliderView()
                                        
                        AppleStoreImagePageView(itemName: "iPhone 14", itemDescription1: "iPhone 14 그리고 큼직한 사이즈의 iPhone 14 Plus. 획기적인", itemDescription2: "도약을 이뤄낸 배터리 성능. 프로급 카메라. 6가지 멋진 컬러.", imageName: "AppleStoreImage1")
                        
                        AppleStoreBottomView(price: "₩1,250,000부터")
                        
                        AppleStoreImagePageView(itemName: "iPad", itemDescription1: "다양한 일상 작업에 맞는 완전히 새롭고, 컬러풀한 iPad. 새로운", itemDescription2: "iPad를 소개합니다.", imageName: "AppleStoreImage2")
                        
                        AppleStoreBottomView(price: "₩1,250,000부터")
                        
                        AppleStoreSwipeProductView()
                    }
            }
            

        }
        
        
        
    }
    @ViewBuilder private var TopView: some View {
        
        AppleStoreHeaderView()
        
        Rectangle()
            .foregroundColor(Color("Divider"))
            .frame(height: 0.3)
    }
}


struct AppleStoreMainView_Previews: PreviewProvider {
    static var previews: some View {
            AppleStoreMainView()
    }
}



