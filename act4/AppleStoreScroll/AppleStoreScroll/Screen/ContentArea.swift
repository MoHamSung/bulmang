//
//  ContentArea.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/07/03.
//

import SwiftUI

struct ContentArea: View {
    
    let contents: [ContentModel] = [
        .init(imageName: "ImgContentL01", descriptionTitle: "채드도 놀란", descriptionSubTitle: "iPhone 14 Pro"),
        .init(imageName: "ImgContentL02", descriptionTitle: "Dynamic Island", descriptionSubTitle: "iPhone을 다루는 완전히\n새로운 방법."),
    ]
    
    let gradientContents = [
        GradientContentModel(imageName: "ImgContentSm01", descriptionTitle: "그 모든걸\n가능케 하는\n브레인", descriptionSubTitle: ""),
        GradientContentModel(imageName: "ImgContentSm02", descriptionTitle: "오래가는 배터리", descriptionSubTitle: "온종일,\n올인."),
        GradientContentModel(imageName: "ImgContentL03", descriptionTitle: "상시표시형 디스플레이.\n잠긴 동안에도\n잠드는 법 없이.", descriptionSubTitle: ""),
        GradientContentModel(imageName: "ImgContentL04", descriptionTitle: "Ceramic Shield", descriptionSubTitle: "그 어떤 스마트폰\n글래스보다 견고한 소재."),
    ]

    var alignment: Alignment = .top
    
    var body: some View {
        ZStack{
            Color("ColorBgBlack")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ForEach(contents) { content in
                    Image(content.imageName)
                        .resizable()
                        .scaledToFit()
                        .overlay(alignment: alignment) {
                            VStack {
                                Text(content.descriptionTitle)
                                Text(content.descriptionSubTitle)
                            }
                            .basicFont(fontSize: 20)
                            .multilineTextAlignment(.center)
                            .offset(y: 40)
                        }
                }

                ForEach(0..<gradientContents.count) { index in
                    let content = gradientContents[index]
                    
                    switch index {
                    case 0:
                        ImageContent(
                            imageName: content.imageName,
                            descriptionTitle: content.descriptionTitle,
                            descriptionSubTitle: content.descriptionSubTitle,
                            xOffset: -90,
                            yOffset: 40,
                            fontSize: 20.0,
                            subfontSize: 54,
                            align: .leading
                        )
                    case 1:
                        ImageContent(
                            imageName: content.imageName,
                            descriptionTitle: content.descriptionTitle,
                            descriptionSubTitle: content.descriptionSubTitle,
                            xOffset: 0,
                            yOffset: 70,
                            fontSize: 20.0,
                            subfontSize: 54,
                            align: .center
                        )
                    case 2:
                        ImageContent(
                            imageName: content.imageName,
                            descriptionTitle: content.descriptionTitle,
                            descriptionSubTitle: content.descriptionSubTitle,
                            xOffset: 0,
                            yOffset: 40,
                            fontSize: 20.0,
                            subfontSize: 54,
                            align: .center
                        )
                    default:
                        ImageContent(
                            imageName: content.imageName,
                            descriptionTitle: content.descriptionTitle,
                            descriptionSubTitle: content.descriptionSubTitle,
                            xOffset: 0,
                            yOffset: 40,
                            fontSize: 20.0,
                            subfontSize: 20,
                            align: .center
                        )
                    }
                }
            }
            .padding(.horizontal, 20)

        }
    }
}

struct ContentArea_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImageContent: View {
    var imageName: String
    var descriptionTitle: String
    var descriptionSubTitle: String
    var xOffset: CGFloat
    var yOffset: CGFloat
    var fontSize: Double
    var subfontSize: Double
    var align: TextAlignment
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .top) {
                VStack {
                    Text(descriptionTitle)
                        .customLinearGradient(fontSize: fontSize)
                    Text(descriptionSubTitle)
                        .customLinearGradient(fontSize: subfontSize)
                }
                .offset(x:xOffset,y:yOffset)
                .multilineTextAlignment(align)
            }
    }
}
