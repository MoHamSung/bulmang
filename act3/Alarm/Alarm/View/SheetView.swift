//
//  HeaderView.swift
//  Alarm
//
//  Created by 하명관 on 2023/06/07.
//


import SwiftUI

struct SheetView: View {
    
    @State var isRepeatAlarm: Bool = false
    @Binding var isBottomSheet: Bool
    @Binding var alarmModel: [AlarmModel]
    @State var time = Date()
    @State var alarmActive: Bool = true
    
    
    var body: some View {
        ZStack {
            Color("ColorBgBlack")
                .ignoresSafeArea()
            VStack {
                
                HeaderView(isBottomSheet: $isBottomSheet, alarmModel: $alarmModel, time: $time,alarmActvie: $alarmActive, date: $time)
                    .padding()
                
                DatePicker(
                    "",
                    selection: $time,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(.wheel).labelsHidden()
                .foregroundColor(.white)
                
                List {
                    HStack(spacing:0){
                        Text("반복")
                            .font(.system(size: 15))
                        Spacer()
                        Text("안 함")
                            .font(.system(size: 15))
                            .padding(.trailing,5)
                            .foregroundColor(Color("ColorFontGray"))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color("ColorFontDarkGray"))
                    }
                    HStack(spacing:0){
                        Text("레이블")
                            .font(.system(size: 15))
                        Spacer()
                        Text("알람")
                            .font(.system(size: 15))
                            .padding(.trailing,5)
                            .foregroundColor(Color("ColorFontDarkGray"))
                    }
                    HStack(spacing:0){
                        Text("레이블")
                            .font(.system(size: 15))
                        Spacer()
                        Text("녹차")
                            .font(.system(size: 15))
                            .padding(.trailing,5)
                            .foregroundColor(Color("ColorFontGray"))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color("ColorFontDarkGray"))
                    }
                    Toggle(isOn: $isRepeatAlarm,label: {
                        HStack(alignment:.firstTextBaseline,spacing:0) {
                            Text("다시 알림")
                                .font(.system(size: 15))
                        }.foregroundColor(Color("ColorFontWhite"))
                    })
                }
                
                //                Text("Selected Date: \(date)")
                //                    .padding()
            }
        }
    }
}

struct UpdateSheetView: View {
    
    @State var isRepeatAlarm: Bool = false
    @Binding var isBottomSheet: Bool
    @Binding var alarmModel: [AlarmModel]
    @State var time = Date()
    @State var alarmActive: Bool = true
    @ObservedObject var item: AlarmModel
    
    var body: some View {
        ZStack {
            Color("ColorBgBlack")
                .ignoresSafeArea()
            VStack {
                
                HeaderView(isBottomSheet: $isBottomSheet, alarmModel: $alarmModel, time: $time,alarmActvie: $alarmActive, date: $time)
                    .padding()
                
                DatePicker(
                    "",
                    selection: $item.date,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(.wheel).labelsHidden()
                .foregroundColor(.white)
                
                List {
                    HStack(spacing:0){
                        Text("반복")
                            .font(.system(size: 15))
                        Spacer()
                        Text("안 함")
                            .font(.system(size: 15))
                            .padding(.trailing,5)
                            .foregroundColor(Color("ColorFontGray"))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color("ColorFontDarkGray"))
                    }
                    HStack(spacing:0){
                        Text("레이블")
                            .font(.system(size: 15))
                        Spacer()
                        Text("알람")
                            .font(.system(size: 15))
                            .padding(.trailing,5)
                            .foregroundColor(Color("ColorFontDarkGray"))
                    }
                    HStack(spacing:0){
                        Text("레이블")
                            .font(.system(size: 15))
                        Spacer()
                        Text("녹차")
                            .font(.system(size: 15))
                            .padding(.trailing,5)
                            .foregroundColor(Color("ColorFontGray"))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color("ColorFontDarkGray"))
                    }
                    Toggle(isOn: $isRepeatAlarm,label: {
                        HStack(alignment:.firstTextBaseline,spacing:0) {
                            Text("다시 알림")
                                .font(.system(size: 15))
                        }.foregroundColor(Color("ColorFontWhite"))
                    })
                }
                
                //                Text("Selected Date: \(date)")
                //                    .padding()
            }
        }
    }
}

struct HeaderView: View {
    
    @Binding var isBottomSheet: Bool
    @Binding var alarmModel: [AlarmModel]
    @Binding var time: Date
    @Binding var alarmActvie: Bool
    @Binding var date : Date

    
    var body: some View {
        HStack(spacing: 0) {
            
            Button {
                isBottomSheet = false
            } label: {
                Text("취소")
                    .font(.system(size: 16))
                    .foregroundColor(Color("ColorFontOrange"))
            }
            
            Spacer()
            
            Text("알람추가")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("ColorFontWhite"))
            
            Spacer()
            
            Button {
                isBottomSheet = false
                alarmModel.append(AlarmModel(date: date))
                
                
                print(alarmModel.count)
                print(Date())
            } label: {
                Text("저장")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorFontOrange"))
            }
        }
    }
}


