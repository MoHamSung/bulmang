## Lv 2 애플스토어

애플스토어 앱 소개(애플 상품 소개및 구매 어플)

<table>
    <thead>
        <tr>
            <th>실제 어플 구현 모습</th>
            <th>클론 어플 구현 모습</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
              <img src= https://github.com/MoHamSung/bulmang/assets/114594496/ee2aecc5-e20c-4d1c-9e99-be4fcef4202f width="294" height="640"/>
            </td>
            <td>  
              <img src= https://github.com/MoHamSung/bulmang/assets/114594496/8e447ace-0e0e-4102-bcef-11e1999c2939 width="294" height="640"/>
            </td>
        </tr>
    </tbody>
</table>

### 피그마로 받은 UI 디자인
<img width="1624" alt="스크린샷 2023-05-25 오전 1 28 39" src="https://github.com/MoHamSung/bulmang/assets/114594496/00aec999-ed7d-4c51-9db1-db9bb2c7d801">
<img width="1624" alt="스크린샷 2023-05-25 오전 1 28 52" src="https://github.com/MoHamSung/bulmang/assets/114594496/45ba2c6d-21a4-41ab-a79d-ca0bccdd2fe2">

### 개발 부분

- Swipe Promotion Interaction 구현 (애플스토어 앱 참고)
    - TapView중 page style를 사용하여 구현
- Indiactor 구현
- Swipe Product Interaction 구현 (애플스토어 앱 참고)
    - Geometry Reader와 offset을 이용하여 구현
- Model을 만들어서  컴포넌트화

```swift
GeometryReader { geo in
                // 전체넓이에서 공백 넓이만 뺀 값
                let width = geo.size.width - (trailingSpace - spacing)
                // 두번째 카드 일 때 양 옆 카드의 끝을 똑같이 보여주는 넓이 값
                let adjustMentWidth = (trailingSpace / 2) - spacing
                
                let size = geo.size
                
                HStack(spacing: spacing){
                    ForEach(swipes) { product in
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
                            .frame(width: geo.size.width - trailingSpace)
                        
                        
                    }
                    
                    let _ = print("secondWidth = \(geo.size.width)")
                }
                
                .padding(.horizontal,20)
                // 이거 디버그 하는 방법 물어보기
                // 가로 위치 조정 -는 카드가 좌측으로 이동 , offset을 드레그 제스처로 값을 게속 업데이트 시켜서 x위치를 실시간 업데이트
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            // out이 width값
                            out = value.translation.width
                            print("out = \(out)")
                        })
                        .onEnded({ value in
                            // value는 시작 위치와 끝나는 위치 표시,움직이는 속도도 표시
                            // translation은 width값과 hegiht값으로 볗놘
                            let offsetX = value.translation.width
                            print("value = \(value)")
                            print("value.translation = \(value.translation)")
                            print("value.translation.widthf = \(value.translation.width)")
                            
                            // ofsset이 화면의 반을 넘기면 Swipe(좌측으로 넘기면 - 우측은 +)
                            let progress = -offsetX / width
                            
                            // 0.5를 넘기면 반올림
                            let roundIndex = progress.rounded()
                            
                            // 배열 에러 방지
                            currentIndex = max(min(currentIndex + Int(roundIndex), swipes.count - 1), 0)
                            
                            
                        })
                )
            }
            .frame(height: 509)
            .animation(.easeInOut, value: offset == 0)
```
