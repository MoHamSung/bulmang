//
//  AppleStoreBottomView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreBottomView: View {
    
    let price: String
    
    var body: some View {
        HStack(alignment: .center,spacing: 0){
            
            Text(price)
                .font(.system(size: 10))
                .fontWeight(.light)
            
            Spacer()
            
            Text("구입하기")
                .font(.system(size: 13))
                .fontWeight(.bold)
                .foregroundColor(Color("AppleStoreBlueColor"))
                .padding(.vertical,6)
                .padding(.horizontal,16)
                .background(Color("ColorButtonGray"))
                .cornerRadius(17)
        }
        .padding(.horizontal,29)
        .frame(maxWidth: .infinity)
        .frame(height: 67)
        .background(Color("BottomColor"))
    }
}

struct AppleStoreBottomView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreMainView()
    }
}
