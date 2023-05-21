//
//  AppleStoreMainView.swift
//  clonecoding_practice
//
//  Created by 하명관 on 2023/05/17.
//

import SwiftUI

struct AppleStoreMainView: View {
    var body: some View {
        VStack (alignment:.leading,spacing: 0) {
            
            AppleStoreHeaderView()
            
            AppleStoreSliderView()

        }
        .padding(.horizontal,20)
    }
}




struct AppleStoreMainView_Previews: PreviewProvider {
    static var previews: some View {
        
            AppleStoreMainView()
    }
}


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
        Divider()
    }
}

struct AppleStoreSliderView: View {

    var dotAppearance = UIPageControl.appearance()
    var body: some View {
    
        TabView {
            ForEach(slides) { slide in
                HStack(alignment: .top,spacing: 0){
                    Image(systemName: slide.imageName)
                        .font(.system(size: slide.fontSize))
                        .padding(.trailing,12)
                    
                    VStack(alignment: .leading,spacing:0){
                        Text(slide.title)
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .padding(.bottom,4)
                            
                        Text(slide.subTitle)
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .padding(.bottom,4)
                        
                        Text("더 알아보기")
                            .foregroundColor(Color("AppleStoreBlueColor"))
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                    }
                }.padding(.top,20)
            }
        }
        .tabViewStyle(.page)
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
        
    }
}


