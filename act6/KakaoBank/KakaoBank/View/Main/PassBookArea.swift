//
//  PassBookArea.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import SwiftUI

struct PassBookArea: View {
    @StateObject private var model = AppModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing:20){
            NavigationLink(destination: DetailView()) {
                HStack(alignment:.bottom){
                    
                    holdingAmountArea()
                    
                    Spacer()
                    
                    buttons()
                }
            }
            
            Rectangle()
                .foregroundColor(.black.opacity(0.5))
                .frame(height: 0.5)
                .frame(maxWidth: .infinity)
            
            safeBox()
        }
        .padding(.horizontal,20)
        .padding(.top,29)
        .padding(.bottom,23)
        .frame(maxWidth: .infinity)
        .background(Color("kakaoYellow"))
        .cornerRadius(18)
        .foregroundColor(.black)
        
    }
    
    @ViewBuilder
    func holdingAmountArea() -> some View {
        HStack(spacing: 8){
            Image("ImgLogoKakao")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(9)
                .background(Color("KakaoBlack200").opacity(0.1))
                .cornerRadius(20)
                .padding(.top,6)
            
            VStack(alignment:.leading,spacing: 6) {
                Text("하명관의 통장 ★")
                    .font(.kakaoCaptionRegular)
                Text("\(model.amount)원")
                    .font(.kakaoMoneyBold)
            }
        }
        .padding(.bottom,40)
    }
    
    @ViewBuilder
    func buttons() -> some View {
        HStack(alignment:.bottom){
            Button {
                
            } label: {
                Text("카드")
                    .modifier(CustomButton(horizontal: 16, vertical: 9, opacity: 0.05, cornerRadius: 30, color: Color("KakaoBlack200")))
                    .foregroundColor(.black)
            }
            Button {
                
            } label: {
                Text("이체")
                    .modifier(CustomButton(horizontal: 16, vertical: 9, opacity: 0.05, cornerRadius: 30, color: Color("KakaoBlack200")))
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    func safeBox() -> some View {
        HStack{
            Text("세이프박스")
                .font(.kakaoCaptionRegular)
            Spacer()
            Text("0원")
                .font(.kakaoMoneySemiBold)
        }
    }
}

struct PassBookArea_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isMainViewAppear: .constant(true) )
    }
}


