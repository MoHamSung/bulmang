//
//  DetailView.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/16.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var model = AppModel()
    
    var body: some View {
        ZStack {
            
            Color("kakaoYellow")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:0){
                HStack(spacing: 0){
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("카뱅")
                    Spacer()
                    Image(systemName: "gearshape")
                }
                
                .padding(.horizontal,15)
                ScrollView{
                    VStack(spacing:0){
                        Text("3333-27-9977524")
                            .foregroundColor(Color("KakaoBlack200").opacity(0.5))
                            .padding(.top,40)
                        
                        Text("\(model.amount)원")
                            .font(.system(size: 35))
                            .font(.kakaoMoneyBigBold)
                            .padding(.top,10)
                        
                        HStack(spacing: 7) {
                            Text("이체하기")
                                .modifier(CustomButton(horizontal: 52, vertical: 18, opacity: 0.06, cornerRadius: 10, color: Color("KakaoBlack200")))
                            
                            Text("대출받기")
                                .modifier(CustomButton(horizontal: 52, vertical: 18, opacity: 0.06, cornerRadius: 10, color: Color("KakaoBlack200")))
                        }
                        .padding(.top,48)
                        
                        
                        HStack(alignment:.top){
                            Text("07.29")
                                .font(.kakaoCaptionRegular)
                                .foregroundColor(Color("kakaoGray200"))
                            
                            VStack(alignment: .leading,spacing: 6){
                                Text("일론머스크")
                                    .font(.kakaoNameSemiBold)
                                Text("#대출")
                                    .font(.kakaoCaptionRegular)
                                    .foregroundColor(Color("kakaoBlue300"))
                            }
                            Spacer()
                            VStack(alignment: .trailing,spacing: 6){
                                Text("500,000,000원")
                                    .font(.kakaoMoneyDealBold)
                                    .foregroundColor(Color("kakaoBlue200"))
                                Text("500,000,000원")
                                    .font(.kakaoMoneyRemainRegular)
                                    .foregroundColor(Color("kakaoGray200"))
                            }
                        }
                        .padding(.horizontal,16)
                        .padding(.vertical, 25)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .padding(.top,36)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
