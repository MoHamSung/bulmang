//
//  CenterView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/10.
//

import SwiftUI

extension View {
    fileprivate func extractButton(_ imageName: String) -> some View {
        Button(action: {
            
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
    }
}

struct MondayView: View {
    let deviceWidth = UIScreen.main.bounds.width
    
    let imageNames = [
        ["ImgContentMon01", "ImgContentMon02", "ImgContentMon03"],
        ["ImgContentMon04", "ImgContentMon05", "ImgContentMon06"],
        ["ImgContentMon07", "ImgContentMon08", "ImgContentMon09"],
        ["ImgContentMon10", "ImgContentMon11", "ImgContentMon12"],
    ]

    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
        
    }
}

struct TuesdayView: View {
    let deviceWidth = UIScreen.main.bounds.width
    
    let imageNames = [
        ["ImgContentTue01", "ImgContentTue02", "ImgContentTue03"],
        ["ImgContentTue04", "ImgContentTue05", "ImgContentTue06"],
        ["ImgContentTue07", "ImgContentTue08", "ImgContentTue09"],
        ["ImgContentTue10", "ImgContentTue11", "ImgContentTue12"],
    ]


    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}

struct WednesdayView: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    let imageNames = [
        ["ImgContentWed01", "ImgContentWed02", "ImgContentWed03"],
        ["ImgContentWed04", "ImgContentWed05", "ImgContentWed06"],
        ["ImgContentWed07", "ImgContentWed08", "ImgContentWed09"],
        ["ImgContentWed10", "ImgContentWed11", "ImgContentWed12"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}

struct ThursdayView: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    let imageNames = [
        ["ImgContentThu01", "ImgContentThu02", "ImgContentThu03"],
        ["ImgContentThu04", "ImgContentThu05", "ImgContentThu06"],
        ["ImgContentThu07", "ImgContentThu08", "ImgContentThu09"],
        ["ImgContentThu10", "ImgContentThu11", "ImgContentThu12"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}

struct FridayView: View {
    let deviceWidth = UIScreen.main.bounds.width
    
    let imageNames = [
        ["ImgContentFri01", "ImgContentFri02", "ImgContentFri03"],
        ["ImgContentFri04", "ImgContentFri05", "ImgContentFri06"],
        ["ImgContentFri07", "ImgContentFri08", "ImgContentFri09"],
        ["ImgContentFri10", "ImgContentFri11", "ImgContentFri12"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}

struct SaturdayView: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    let imageNames = [
        ["ImgContentSat01", "ImgContentSat02", "ImgContentSat03"],
        ["ImgContentSat04", "ImgContentSat05", "ImgContentSat06"],
        ["ImgContentSat07", "ImgContentSat08", "ImgContentSat09"],
        ["ImgContentSat10", "ImgContentSat11", "ImgContentSat12"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}

struct SundayView: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    let imageNames = [
        ["ImgContentSun01", "ImgContentSun02", "ImgContentSun03"],
        ["ImgContentSun04", "ImgContentSun05", "ImgContentSun06"],
        ["ImgContentSun07", "ImgContentSun08", "ImgContentSun09"],
        ["ImgContentSun10", "ImgContentSun11", "ImgContentSun12"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}

struct NewdayView: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    let imageNames = [
        ["ImgContentNew01", "ImgContentNew02", "ImgContentNew03"],
        ["ImgContentNew04", "ImgContentNew05", "ImgContentNew06"],
        ["ImgContentNew07", "ImgContentNew08", "ImgContentNew09"],
        ["ImgContentNew10", "ImgContentNew11", "ImgContentNew12"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        extractButton(imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}




struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        FridayView()
    }
}
