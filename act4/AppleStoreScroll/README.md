## Lv 4 애플스토어 스크롤

애플스토어 스크롤 

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
              <img src= https://github.com/MoHamSung/bulmang/assets/114594496/a7b53ac4-e6fb-403c-8e50-1e1abe40fe64 width="294" height="640"/>
            </td>
            <td>  
              <img src= https://github.com/MoHamSung/bulmang/assets/114594496/bed67441-c048-4ac3-9c53-8df9ee354c6a width="294" height="640"/>
            </td>
        </tr>
    </tbody>
</table>


### 피그마로 받은 UI 디자인
<img width="1624" alt="스크린샷 2023-05-25 오전 1 28 39" src="https://github.com/MoHamSung/bulmang/assets/114594496/4cbe3970-7cb4-4032-9176-f58291b1fd56">

### 개발 부분

- Scroll 길이 계산 (애플스토어 앱 참고)
    - UIScreen.main.bounds.height 사용 (GeometryReader도 가능)
- PreferenceKey 프로토콜 사용
    - 기능 : SwiftUI의 레이아웃 시스템에서 뷰의 크기, 위치 또는 다른 사용자 정의 정보와 같은 데이터를 수집하고 공유하기 위해 사용
- 디바이스의 높이를 측정
- enum, switch 사용하여 색상마다 View를 다르게 그려줌

### Swipe Animation

```swift
.onPreferenceChange(OffsetPreferenceKey.self) { value in
                currentHeight = value
                print("currentHeight: \(value)")
                
                // 현재 디바이스 기기의 높이를 측정하여 내가 원하는 지점에서 Bool값을 바꿔줌
                if -(currentHeight - UIScreen.main.bounds.height) < (wholeViewHeight - purchaseHeight - footerHeight){
                    withAnimation(.spring(response:0.5,dampingFraction:0.5,blendDuration: 0.5)){
                        isButtonActive = true
                    }
                } else {
                    withAnimation(.spring(response:0.5,dampingFraction:0.5,blendDuration: 0.5)){
                        isButtonActive = false
                    }
                }
                print (-(currentHeight - UIScreen.main.bounds.height))
                print (wholeViewHeight - productHeight)
            }
// 레이아웃 시스템의 뷰의 위치 데이터를 수집

struct OffsetPreferenceKey: PreferenceKey {
    // 화면위치의 초기값
    static var defaultValue: CGFloat = 0
    
    //inout 매개변수를 통해 값을 변경해야함, nextValue를 호출하여 새로운값을 가져와서 업데이트
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
```
