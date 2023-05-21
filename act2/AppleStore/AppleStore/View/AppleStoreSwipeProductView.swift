//
//  AppleStoreSwipeProductView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreSwipeProductView: View {
    
    var swipeIndicator = UIPageControl.appearance()
    
    var body: some View {
        
        VStack {
            
            Text("추천")
                .font(.system(size: 24))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,38)
                .padding(.bottom,38)
                .padding(.leading)
            
            TabView {
                ForEach(swipes){ swipe in
                    VStack(spacing: 0) {

                        Image(swipe.imageName)
                            .resizable()
                            .scaledToFit()
                            .overlay{
                                VStack(alignment:.leading,spacing: 0){
                                    
                                    Text(swipe.title)
                                        .font(.system(size: 26))
                                        .foregroundColor(swipe.textColor)
                                        .fontWeight(.heavy)
                                        .padding(.top,38)
                                        
                                    
                                    Text(swipe.subTitle)
                                        .padding(.top,8)
                                        .foregroundColor(swipe.textColor)
                                    Spacer()
                                }
                                .padding(.leading,20)
                                .frame(maxWidth: .infinity,alignment: .leading)

                            }
                    }
                    .padding(.horizontal,20)
                }
            }
            
            .tabViewStyle(.page(indexDisplayMode: .never)) 
            .frame(height: 509)
            .shadow(radius: 5,x:1,y:1)
            .tabViewStyle(.page)

            
            
            Spacer()
        }
    }
}

struct AppleStoreSwipeProductView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreSwipeProductView()
    }
}
