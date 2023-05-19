# Lv 1 출쓱

출쓱 앱 소개(애플 디벨로퍼 아카데미에 출석 관리 어플

실제 화면

![출쓱 GIf](https://github.com/MoHamSung/bulmang/assets/114594496/66d922c6-409f-4427-8dcd-29eb63e7605a)


개발 화면

<img src= https://github.com/MoHamSung/bulmang/assets/114594496/589ba892-34f6-4f73-a499-a4d9ae60827f width="294" height="640"/>


### 피그마로 받은 UI 디자인

<img width="867" alt="스크린샷 2023-05-03 오전 2 13 33" src="https://github.com/MoHamSung/bulmang/assets/114594496/39c0446c-61cc-4482-9805-af9f7e25c7c1">



### **잘 몰랐던 문법**

- **`() -> Front`**는 클로저 타입을 나타냄
- 제네릭
    - `<Generic 타입 매개변수>` `< >`
    - `func count<Number>(numbers: [Number]) { }`
    - 매개 변수화된 타입(Parameterized Type)을 만들기 위해 사용되는 기능
    - 함수나 클래스에서 사용할 데이터 타입을 미리 지정하지 않고, 함수 또는 클래스를 호출할 때 전달되는 인자에 따라 동적으로 타입을 결정
    - 코드의 재사용성과 유연성,타입의 안정성 보장
- **`Flashcard(front: {CardFrontView()}, back: {CardBackView()})`**
    - **`Flashcard`** 구조체를 생성하는 방법 중 하나
    **`front`**와 **`back`** 프로퍼티에 앞면(**`CardFrontView`**)과 뒷면(**`CardBackView`**) 뷰를 생성하는 클로저를 전달
    - **`{ CardFrontView() }`**는 **`CardFrontView()`**를 인스턴스화하는 클로저
- **`where`**
    - **`Flashcard`** 구조체에 대한 제네릭 타입 제약을 추가
    - **`Front`**와 **`Back`**은 뷰(View) 형식이어야 하며, 이를 나타내기 위해 **`Front: View`**와 **`Back: View`**라고 선언합니다. 이러한 제약 조건을 추가하면 **`Flashcard`** 구조체가 **`Front`**와 **`Back`** 뷰 외에 다른 유형을 사용하지 않도록 강제할수 있음
    - **`where T: Equatable`**는 제네릭 타입 **`T`**가 **`Equatable`** 프로토콜을 따르도록 강제하는 제약 조건



