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
            VStack(alignment: .leading, spacing: 5) {
                Text("이번 달까지만 혜택 드려요")
                    .font(kakaoCaptionMedium)
                Text("랜덤 캐시가 쏙! 신용관리 루틴 챌린지")
                    .font(kakaoCaptionSemiBold)
            }
            .padding(.horizontal,24)
            .padding(.vertical,12)
            
            Image("swift icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 38)
            
        }
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

