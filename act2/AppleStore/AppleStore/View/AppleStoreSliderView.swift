//
//  AppleStoreSliderView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreSliderView: View {

    var indicator = UIPageControl.appearance()
    var body: some View {
    
        
            TabView {
                ForEach(slides) { slide in
                    VStack {
                        HStack(alignment: .top,spacing: 0){
                            Image(systemName: slide.imageName)
                                .font(.system(size: slide.fontSize))
                                .padding(.trailing,12)
                                .padding(.leading,20)
                            
                            VStack(alignment: .leading,spacing:0){
                                Text(slide.title)
                                    .font(.system(size: 13))
                                    .fontWeight(.bold)
                                    .padding(.bottom,4)
                                    
                                Text(slide.subTitle)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .padding(.bottom,4)
                                    .frame(maxWidth: .infinity,alignment:.leading)
                                    
                                Text("더 알아보기")
                                    .foregroundColor(Color("AppleStoreBlueColor"))
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    
                            }
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                }
            }
            .frame(height: 138)
            .tabViewStyle(.page)
            .onAppear {
                indicator.currentPageIndicatorTintColor = .black
                indicator.pageIndicatorTintColor = .gray
        }
            

        
    }
}

struct AppleStoreSliderView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreSliderView()
    }
}
