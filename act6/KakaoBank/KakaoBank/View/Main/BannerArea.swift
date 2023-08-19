//
//  BannerArea.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import SwiftUI

struct BannerArea: View {
    var body: some View {
        HStack{
            VStack(spacing: 5) {
                Text("이번 달까지만 혜택 드려요")
                    .font(.kakaoCaptionMedium)
                    .frame(maxWidth: .infinity,alignment:.leading)
                Text("랜덤 캐시가 쏙! 신용관리 루틴 챌린지")
                    .font(.kakaoMoneyBold)
                    .frame(maxWidth: .infinity,alignment:.leading)
            }
            .padding(.vertical,12)
            .overlay(alignment:.trailing){
                Image("swift icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical,8)
            }
                
 
        }
        .padding(.horizontal,20)
        .frame(maxWidth: .infinity)
        .background(Color("kakaoWhite200"))
        .cornerRadius(20)
    }
}

struct BannerArea_Previews: PreviewProvider {
    static var previews: some View {
        BannerArea()
    }
}

