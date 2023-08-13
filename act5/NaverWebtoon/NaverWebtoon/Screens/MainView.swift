//
//  MainView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/07.
//

import SwiftUI

struct MainView: View {
    //MARK: PROPERTIES
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing:0) {
                    
                    let height = UIScreen.main.bounds.height
                    
                    //MARK: HEADER
                    HeaderArea()
                    
                    //MARK: CENTER
                    CenterViewTab()
                    
                    //MARK: FOOTER
                    FooterView()
                    

                }
            }
            .ignoresSafeArea()
        }
    }
    @ViewBuilder
    func FooterView() -> some View{
        
        CustomDivider()
        
        Button {
            
        } label: {
            HStack(spacing: 3){
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(Color("IconGreen"))
                Text("랜덤 작품")
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                Text("보러가기")
                    .font(.system(size: 16))
                Image(systemName: "chevron.right")
            }
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        
        CustomDivider()
        
        Text("웹툰에서 제공되는 콘텐츠의 저작권은 저자 또는 제공처에 있으며,\n이를 무단 이용하는 경우 저작권법 등에 따라 법적 책임을 질 수 있습니다.")
            .font(Font.custom("Pretendard", size: 12))
            .foregroundColor(Color("FontGray200"))
            .padding(.leading, 15)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("FontGray100"))
        
        Divider()
            .padding(.bottom,40)
        
        HStack(alignment: .center, spacing: 6) {
            Text("네이버웹툰 이용약관")
            Text("|")
            Text("전용상품 이용약관")
            Text("|")
            Text("개인정보처리방침")
        }
        .foregroundColor(Color("FontGray100"))
        .font(.system(size: 10))
        
        .padding(.bottom,6)
        HStack(alignment: .center, spacing: 6) {
            Text("고객센터")
            Text("|")
            Text("오류신고")
        }
        .foregroundColor(Color("FontGray100"))
        .font(.system(size: 10))
        .padding(.bottom,11)
        
        Text("ⓒ NAVER WEBTOON Limited")
            .foregroundColor(Color("FontGray100"))
            .font(.system(size: 8))
            .padding(.bottom,40)
    }
    @ViewBuilder
    func CustomDivider() -> some View {
        Rectangle()
            .frame(height: 10)
            .foregroundColor(Color("DividerGray"))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

