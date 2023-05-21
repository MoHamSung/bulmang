//
//  ImagePageView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreImagePageView: View{
    
    let itemName: String
    let itemDescription1: String
    let itemDescription2: String
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .overlay {
                VStack(alignment: .leading,spacing: 0){
                    
                    Text("NEW")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ColorFontGray"))
                        .padding(.top,24)
                        
                    Text(itemName)
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .padding(.top,2)
                    
                    Text(itemDescription1)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .padding(.top,12)
                    
                    Text(itemDescription2)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .padding(.top,3)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,20)
            }
    }
}

struct AppleStoreImagePageView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreMainView()
    }
}
