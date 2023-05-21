//
//  AppleStoreHeaderView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreHeaderView: View {
    var body: some View{
        HStack(spacing: 0){
            Text("쇼핑하기")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .padding(.top,54)
            Spacer()
            Image("AppleStoreLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 37, height: 36)
                .padding(.top, 48)
        }
        .frame(height: 100)
        .padding(.bottom,10)
        
    }
}

struct AppleStoreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreHeaderView()
    }
}
