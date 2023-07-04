//
//  FooterView.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/07/04.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color("ColorBgWhite"))
                .cornerRadius(15)
                .frame(height: 38)
                .frame(maxWidth: .infinity)
                .padding(.horizontal,132)
                .overlay{
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                        Text("공유하기")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color("ColorBtnBlue"))
                }
                .padding(.bottom,80)
            
            
            Text("1. iPhone 14 Pro 및 iPhone 14 Pro Max는 IEC 규격 60529하의 IP68 (이 문구를 발견하고 톡방에 올리면, 엠선생님의 NearMe 무료 음료수 이용권 증정)")
                .font(.system(size: 10))
                .foregroundColor(Color("ColorFontDarkGray"))
                .padding(.horizontal,10)
                .padding(.bottom,20)
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
