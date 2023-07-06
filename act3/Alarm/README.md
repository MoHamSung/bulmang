## Lv 3 알람

알람 앱 

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
              <img src= https://github.com/MoHamSung/bulmang/assets/114594496/286995f4-e1bd-435e-bc40-3d64650c73d2 width="294" height="640"/>
            </td>
            <td>  
              <img src= https://github.com/MoHamSung/bulmang/assets/114594496/cc6c58d9-13b9-4ff1-8d47-563ba4665a1c width="294" height="640"/>
            </td>
        </tr>
    </tbody>
</table>


### 피그마로 받은 UI 디자인
<img width="1624" alt="스크린샷 2023-05-25 오전 1 28 39" src="https://github.com/MoHamSung/bulmang/assets/114594496/7f3d8884-daa6-4f34-bdf9-43633559f33c">
<img width="1624" alt="스크린샷 2023-05-25 오전 1 28 52" src="https://github.com/MoHamSung/bulmang/assets/114594496/eda8be0e-fc2c-4ec4-af28-b14e71ab3d3b">
<img width="1624" alt="스크린샷 2023-05-25 오전 1 28 39" src="https://github.com/MoHamSung/bulmang/assets/114594496/81e4cd9e-6d0c-4e80-b07f-8fd9fd509f6b">

### 개발 부분

- ObservableObject, @StateObject, @ObservedObject 사용하여 데이터 전달
- MainView는 List를 사용하여 Scroll했을때 navigationTitle이 Header 가운데에 올라감
- 알람을 List에 append하는 방식

- 알람 모델 
```swift
class AlarmModel: Identifiable,ObservableObject {
    
    let id : UUID = UUID()
    var time: String
    var amPm: String
    var date: Date
    
    @Published var alarmActive: Bool
    
    // MARK: CREATE ALARM LIST
    init(date: Date) {
        
        self.date = date
        
        alarmActive = true
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm"
        time = formatter.string(from: date)
        
        formatter.dateFormat = "a"
        amPm = formatter.string(from: date)
    
    }
    
    // MARK: UPDATE ALARM LIST
    func updateAlarm(date: Date) {
     
        self.date = date
        
        alarmActive = true
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm"
        time = formatter.string(from: date)
        
        formatter.dateFormat = "a"
        amPm = formatter.string(from: date)
    }
    
}
```
