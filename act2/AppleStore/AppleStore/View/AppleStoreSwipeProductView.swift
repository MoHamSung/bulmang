//
//  AppleStoreSwipeProductView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreSwipeProductView: View {
    
    @State var currentIndex: Int = 0
    var products: [SwipeModel] = []
    
    var spacing: CGFloat = 20
    var trailingSpace: CGFloat = 60
    @GestureState var offset: CGFloat = 0
    
    var body: some View {
        
        VStack {
            
            Text("추천")
                .font(.system(size:24))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,38)
                .padding(.bottom,38)
                .padding(.leading)
            
            
            GeometryReader { geo in

                let width = geo.size.width - (trailingSpace - spacing)
                let _ = print("firstWidth = \(width)")
                let adjustMentWidth = (trailingSpace / 2) - spacing
                let _ = print("adjustMentWidth = \(adjustMentWidth)")
                let size = geo.size

                HStack(spacing: 0){
                    ForEach(swipes) { product in
                        VStack(spacing: 0) {
                            Image(product.imageName)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 5,x:1,y:1)
                                .overlay{
                                    VStack(alignment:.leading,spacing: 0){

                                        Text(product.title)
                                            .font(.system(size: 26))
                                            .foregroundColor(product.textColor)
                                            .fontWeight(.heavy)
                                            .padding(.top,38)

                                        Text(product.subTitle)
                                            .padding(.top,8)
                                            .foregroundColor(product.textColor)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading,20)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                }
                                .padding(.horizontal,20)
                                .frame(width: geo.size.width)
                                

                        }
                        .frame(width: geo.size.width - trailingSpace,height: 509)

                        let _ = print("secondWidth = \(geo.size.width)")
                    }
                }
                .padding(.horizontal,spacing)
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded({ value in
                            
                            let offsetX = value.translation.width
                            print("value = \(value)")
                            print("value.translation = \(value.translation)")
                            print("value.translation.widthf = \(value.translation.width)")
                            
                            let progress = -offsetX / width
                            print("progress  = \(progress)")
                            
                            let roundIndex = progress.rounded()

                            // setting min...
                            currentIndex = max(min(currentIndex + Int(roundIndex), swipes.count - 1), 0)

                        })
                )
            }
            .animation(.easeInOut, value: offset == 0)
            

        Spacer()
            
        }
    }
}

struct AppleStoreSwipeProductView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreSwipeProductView()
    }
}
