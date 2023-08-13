//
//  HeaderView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/07.
//

//
//  HeaderArea.swift
//  act5
//
//  Created by YouiHyon Kim on 2023/07/05.
//

import SwiftUI

struct HeaderArea: View {
    let spacing: CGFloat = 10
    let trailingSpace: CGFloat = 32
    let deviceWidth = UIScreen.main.bounds.width
    
    @GestureState private var dragOffset: CGFloat = 0
    
    @State private var headViewHeight: CGRect = .zero
    @State var currentIndex = 0
        
        var body: some View {
            GeometryReader { geo in
                let width = geo.size.width - (                        trailingSpace - spacing)
                
                ZStack(alignment: .bottomLeading) {
                    ForEach(swipeProducts) { product in
                        Image(product.backgroundImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: deviceWidth)
                            .opacity(getOpactiy(for: product, dragOffset: dragOffset, width: UIScreen.main.bounds.width))
                    }
                    
                    HStack(spacing: spacing) {
                        ForEach(swipeProducts) { product in
                            Image(product.lineBannerImage)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 5, x: 1, y: 1)
                                .frame(width: geo.size.width - trailingSpace)
                        }
                    }
                    .padding(.horizontal, 16)
                    .offset(x: (CGFloat(currentIndex) * -width) + dragOffset)
                }
                .fixedSize()
                .modifier(GetHeightModifier())
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            print("전" ,state)
                            state = value.translation.width
                            print(state)
                        }
                        .onEnded { value in
                            let offsetX = value.translation.width
                            let progress = -offsetX / width
                            let roundIndex = progress.rounded()
                            currentIndex = max(min(currentIndex + Int(roundIndex), swipeProducts.count - 1), 0)
                        }
                )
            }
            .frame(height: headViewHeight.size.height)
            .animation(.easeInOut, value: dragOffset == 0)
            .onPreferenceChange(ContentRectSize.self) { rects in
                self.headViewHeight = rects
            }
        }
    
    private func getOpactiy(for banner: HeaderBanner, dragOffset: CGFloat, width: CGFloat) -> CGFloat {
        
        let getEachBannerDisplayIndex = CGFloat(banner.index - currentIndex)
        
        let bannerOffset = getEachBannerDisplayIndex * width
        
        let bannerDragOffset = bannerOffset + dragOffset
        
        let getOpactiy = (bannerDragOffset/UIScreen.main.bounds.width).magnitude

        return Double(1 - getOpactiy)
    }
}

struct HeaderAreaTest_Previews: PreviewProvider {
    static var previews: some View {
        HeaderArea()
    }
}

struct HeaderBanner: Identifiable {
    let id = UUID()
    var lineBannerImage : String
    var backgroundImage : String
    var index : Int
}

var swipeProducts = [
    HeaderBanner(lineBannerImage: "ImgLineBanner01", backgroundImage : "ImgBanner01", index : 0 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner02", backgroundImage : "ImgBanner02", index : 1 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner03", backgroundImage : "ImgBanner03", index : 2 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner04", backgroundImage : "ImgBanner04", index : 3 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner05", backgroundImage : "ImgBanner05", index : 4 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner06", backgroundImage : "ImgBanner06", index : 5 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner07", backgroundImage : "ImgBanner07", index : 6 ),
    HeaderBanner(lineBannerImage: "ImgLineBanner08", backgroundImage : "ImgBanner08", index : 7 ),
]
struct ContentRectSize : PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
    
}

struct GetHeightModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(GeometryReader {
                Color.clear.preference(key: ContentRectSize.self,
                                              value: $0.frame(in: .local))
            })
    }
}
