//
//  MainView.swift
//  Alarm
//
//  Created by 하명관 on 2023/06/07.
//

import SwiftUI

struct MainView: View {
    
    @State var isToggle: Bool = false
    @State var isBottomSheet: Bool = false
    @State var isUpdateSheet: Bool = false
    @State var alarmModel = [AlarmModel]()
    @State var currentTime : AlarmModel?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorBgBlack")
                    .ignoresSafeArea(.all)
                
                List(){
                    
                    HeaderView
                    
                        ForEach(alarmModel) { item in
                            Button {
                                currentTime = item
                            } label: {
                                alarmTime(alarm: item)
                            }
                        }
                        .onDelete { index in
                            alarmModel.remove(atOffsets: index)
                        }
                        .sheet(item: $currentTime) { item in
                            UpdateSheetView(alarmModel: $alarmModel, item: item)
                        }
                
                        //  item 값이 변경될때마다 시트가 업데이트 하도록 설정함
                    
                    
                }
                .listStyle(.plain)
                .toolbar {
                    ZStack{
                        
                    }
                    Button{
                        isBottomSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color("ColorIconOrange"))
                            .font(.system(size: 16))
                    }
                }
                .navigationTitle("알람")
            }
            .sheet(isPresented: $isBottomSheet) {
                VStack{
                    SheetView( isBottomSheet: $isBottomSheet,alarmModel: $alarmModel)
                }
            }
        }
        
        
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
    
    @ViewBuilder private var HeaderView: some View {
        HStack(spacing: 0) {
            Image(systemName: "bed.double.fill")
            
            Text("수면 | 기상")
                .font(.system(size: 17))
            
        }
        .padding(.top,36)
        .foregroundColor(Color.white)
        
        HStack(alignment:.center) {
            Text("알람 없음")
                .foregroundColor(Color("ColorFontGray"))
            
            
            Spacer()
            
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("ColorBgGray"))
                .overlay{
                    Text("설정")
                        .font(.system(size: 13))
                        .cornerRadius(20)
                        .foregroundColor(Color("ColorIconOrange"))
                        .padding(.vertical,6)
                        .padding(.horizontal,9)
                }
                .frame(width: 42,height: 28)
        }
        .frame(height: 60)
        
        Text("기타")
            .font(.system(size: 17))
            .foregroundColor(Color("ColorFontWhite"))
            .padding(.top,36)
    }
}





struct alarmTime: View {
    
    @StateObject var alarm: AlarmModel
    
    var body: some View{
        
        Toggle (isOn: $alarm.alarmActive) {
            HStack(alignment: .firstTextBaseline,spacing: 0){
                
                Text("\(alarm.amPm)")
                    .font(.system(size: 35))
                
                Text("\(alarm.time)")
                    .font(.system(size: 59))
                
            }
            .foregroundColor(Color.white)
        }
    }
}
