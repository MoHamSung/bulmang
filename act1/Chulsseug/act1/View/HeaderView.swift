//
//  HeaderView.swift
//  CloneCoding
//
//  Created by 하명관 on 2023/04/29.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0){
            
            Spacer()
            
            Image(systemName: "calendar")
                .font(.system(size: 22.6687))
                .padding(.trailing,16)
                .foregroundColor(Color("ChulsseugPurpleColor"))
            
            Image(systemName: "gearshape")
                .foregroundColor(Color("ChulsseugPurpleColor"))
                .font(.system(size: 22.6687))
        }
        .frame(height: 51)
        .padding(.trailing,5)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
