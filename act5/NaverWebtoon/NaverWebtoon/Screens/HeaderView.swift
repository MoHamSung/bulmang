//
//  HeaderView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/07.
//

import SwiftUI

struct HeaderView: View {
    // MARK: Properties
    @State private var currentIndex = 0
    @State private var currentOpacity:CGFloat = 0
    
    @GestureState var offset:CGFloat = 0
    
    private let trailingPadding:CGFloat = 8
    private let totalPadding:CGFloat = 32
    private let images = ["ImgBanner01", "ImgBanner02", "ImgBanner03", "ImgBanner04", "ImgBanner05","ImgBanner06","ImgBanner07","ImgBanner08"]
    
    let imgBannerModel: [ImgBannerModel] = [
        .init(imgBanner: "ImgBanner01", imgLinBanner: "ImgLineBanner01"),
        .init(imgBanner: "ImgBanner02", imgLinBanner: "ImgLineBanner02"),
        .init(imgBanner: "ImgBanner03", imgLinBanner: "ImgLineBanner03"),
        .init(imgBanner: "ImgBanner04", imgLinBanner: "ImgLineBanner04"),
        .init(imgBanner: "ImgBanner05", imgLinBanner: "ImgLineBanner05"),
        .init(imgBanner: "ImgBanner06", imgLinBanner: "ImgLineBanner06"),
        .init(imgBanner: "ImgBanner07", imgLinBanner: "ImgLineBanner07"),
        .init(imgBanner: "ImgBanner08", imgLinBanner: "ImgLineBanner08")
    ]

    @State private var opacity = 1.0
    
    var body: some View {
        let imageWidth = UIScreen.main.bounds.width
        let imageHeight = UIScreen.main.bounds.height
        GeometryReader { geo in
            
            let width = geo.size.width - (totalPadding - trailingPadding)
            
            Group{
                ForEach(0..<images.count) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .opacity(index == currentIndex ? 1 : 0)
                }
                
                HStack(spacing: trailingPadding) {
                    ForEach(imgBannerModel) { img in
                        Image(img.imgLinBanner)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width - totalPadding)
                            .offset(x: (CGFloat(currentIndex) * -width) + offset,y: imageHeight/4.1)
                    }
                    .animation(.easeInOut,value: offset == 0)
                }
                .padding(.horizontal,16)
            }
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        let swipe = -offsetX/width
                        let roundIndex = swipe.rounded()
                        
                        withAnimation(.linear){
                            currentIndex = max(min(currentIndex + Int(roundIndex), imgBannerModel.count - 1),0)
                            
                        }
                        

                    })
            )
        }
        .frame(width: imageWidth,height: imageHeight/3.4)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
