//
//  ProductArea.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/07/03.
//

import SwiftUI

struct ProductArea: View {
    var body: some View {
        
            VStack(spacing: 10) {
                
                Text("iPhone 14 Pro 더 깊이 살펴보기")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .padding(.top,60)
                
                Button {
                    
                } label: {
                    Text("apple.com에서 더 알아보기")
                }
                .padding(.bottom,60)
                

                
                
            }
            .frame(maxWidth: .infinity)
            .background(Color("ColorBgWhite"))
        
    }
}

struct ProductArea_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
