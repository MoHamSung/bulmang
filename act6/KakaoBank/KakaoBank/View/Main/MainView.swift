//
//  MainView.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import SwiftUI

struct MainView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var shadowAppear = false
    
    @Binding var isMainViewAppear: Bool
    
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    Group {
                        BannerArea()
                            .padding(.top,144)
                            .modifier(SpringAnimation(dealy: 0.1))
                        
                        PassBookArea()
                            .modifier(SpringAnimation(dealy: 0.2))
                            
                        plusArea()
                            .modifier(SpringAnimation(dealy: 0.3))
                        
                        bottomOptionArea()
                            .modifier(SpringAnimation(dealy: 0.4))
                    }
                    .offset(y: isMainViewAppear ? 0 : 500 )
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear
                                .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .global).minY)
                        }
                    )
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        handleScrollOffsetUp(value)
                    }
                }// ScrollView
                .padding(.horizontal,20)
                VStack{
                    HeadArea(shadowAppear: $shadowAppear)
                    Spacer()
                }
            }
            .onAppear {
                withAnimation(.default) {
                    self.isMainViewAppear = true
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .tint(.clear)
    }
    
    @ViewBuilder
    func plusArea() -> some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 18))
                .foregroundColor(Color("kakaoGray200"))
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(Color("kakaoWhite200"))
                .cornerRadius(18)
        }
    }
    
    @ViewBuilder
    func bottomOptionArea() -> some View {
        HStack(spacing:33){
            Text("간편 홈")
            Text("|")
            Text("화면 편집")
        }
        .foregroundColor(Color("kakaoGray200"))
        .font(.system(size: 14))
        .font(.kakaoCaptionRegular)
        .padding(.vertical, 38)
        .frame(maxWidth: .infinity)
    }
    
    func handleScrollOffsetUp(_ offset: CGFloat) {
        if offset < -10 {
            shadowAppear = true
        } else {
            shadowAppear = false
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



