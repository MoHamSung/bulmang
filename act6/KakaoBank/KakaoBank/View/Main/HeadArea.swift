//
//  HeadArea.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import SwiftUI

struct HeadArea: View {
    @Binding var shadowAppear: Bool
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color("kakaoWhite300"))
            .shadow(color: shadowAppear ? Color.black.opacity(0.15) : Color.clear, radius: 1, x: 0, y: 1)
            .overlay(alignment: .bottom){
                HStack(alignment:.bottom,spacing: 6) {
                    Text("하명관")
                        .font(.kakaoHeadlineSemiBold)
                    
                    Text("내 계좌")
                        .modifier(CustomButton(horizontal: 12, vertical: 7, opacity: 1, cornerRadius: 14, color: Color("kakaoWhite200")))

                    Spacer()
                    
                    Image("ImgProfile06")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .padding(.bottom,5)
                    
                }
                .padding(.horizontal,28)
                .padding(.bottom, 10)
            }
            .frame(height: 134)
            .frame(maxWidth: .infinity)
    }
}

