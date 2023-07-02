//
//  AlarmModel.swift
//  Alarm
//
//  Created by 하명관 on 2023/06/07.
//

import Foundation
import Combine

class AlarmModel: Identifiable,ObservableObject {
    
    let id = UUID()
    var time: String
    var amPm: String
    var date: Date
    
    @Published var alarmActive: Bool
    
    init(date: Date) {
        
        self.date = date
        
        alarmActive = true
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm"
        time = formatter.string(from: date)
        
        formatter.dateFormat = "a"
        amPm = formatter.string(from: date)
    
    }
    
    func updateAlarm(date: Date) {
     
        self.date = date
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm"
        time = formatter.string(from: date)
        
        formatter.dateFormat = "a"
        amPm = formatter.string(from: date)
    }
    
}

