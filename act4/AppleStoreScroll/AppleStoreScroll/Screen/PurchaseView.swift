//
//  PurchaseView.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/07/04.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        ZStack {
            Color("ColorBgGray")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Image("ImgProduct01")
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .top){
                        VStack {
                            Button {
                                
                            } label: {
                                Text("구입하기")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,14)
                                    .background(
                                        Color("ColorBtnBlue")
                                    )
                                    .cornerRadius(15)
                            }
                            
                            Text("₩ 1,550,000부터")
                                .foregroundColor(.black)
                                .font(.system(size: 10))
                            
                        }
                        .offset(y: 441)

                    }
            }
            .foregroundColor(Color("ColorBgWhite"))
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
