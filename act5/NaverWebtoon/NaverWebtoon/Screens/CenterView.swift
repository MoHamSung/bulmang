//
//  CenterView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/10.
//

import SwiftUI

extension View {
    fileprivate func extractButton(_ imageName: String, _ contentName: String, _ contentAuthor: String) -> some View {
        Button(action: {
            
        }) {
            VStack(alignment:.leading,spacing: 5) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(contentName)
                    .frame(width: 117, height: 18,alignment: .leading)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(contentAuthor)
                    .font(.system(size: 10))
                    .fontWeight(.light)
                    .foregroundColor(.black)
            }
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
    let contentNames = [
        ["그냥 선생님", "멸망급 ADA의 선생님", "엠케이가 간다!"],
        ["아이들의 엠선생님", "엠케이의 교실", "공부의 결과"],
        ["공부를 뇌에서 뽑으면", "공부하기 좋은 날", "초월자 학원의 수강생이 되었다."],
        ["애플까지 걸어서 1분", "스터디 그룹", "지금 우리 학교는"],
    ]
    let contentAuthors = [
        ["엠케이★9.99", "엠케이★9.99", "엠케이★9.99"],
        ["엠케이★9.99", "엠케이★9.99", "엠케이★9.99"],
        ["엠케이★9.99", "엠케이★9.99", "엠케이★9.99"],
        ["엠케이★9.99", "엠케이★9.99", "엠케이★9.99"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row } ?? 0
                        let colIndex = row.firstIndex(of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
    let contentNames = [
        ["놓았다! 정신줄!", "외모지하주의", "하남자"],
        ["광마회귀", "절대복종", "나혼자 쪼렙"],
        ["개(를) 빻았다", "선을 넘은 김래원", "이십팔세기"],
        ["아카데미 탈출일지", "유쾌한 왕따", "세기말 풋사과 보습학원"],
    ]
    let contentAuthors = [
        ["김래원 ★9.78", "김래원 ★9.78", "김래원 ★9.78"],
        ["김래원 ★9.78", "김래원 ★9.78", "김래원 ★9.78"],
        ["김래원 ★9.78", "김래원 ★9.78", "김래원 ★9.78"],
        ["김래원 ★9.78", "김래원 ★9.78", "김래원 ★9.78"],
    ]


    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row } ?? 0
                        let colIndex = row.firstIndex(of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(width: deviceWidth)
    }
}
//
struct WednesdayView: View {

    let deviceWidth = UIScreen.main.bounds.width
    let imageNames = [
        ["ImgContentWed01", "ImgContentWed02", "ImgContentWed03"],
        ["ImgContentWed04", "ImgContentWed05", "ImgContentWed06"],
        ["ImgContentWed07", "ImgContentWed08", "ImgContentWed09"],
        ["ImgContentWed10", "ImgContentWed11", "ImgContentWed12"],
    ]
    let contentNames = [
        ["근육귀환", "성스러운 헬창생활", "전지적 채드기준"],
        ["근육연애", "내가 키운 근육들", "시한부 만들뻔 했어요!"],
        ["근육을 훔친이는 누구인가", "선을 넘은 김래원", "내가 운동을 결심한 것은"],
        ["맞짱깔래?", "66666년 만에 환생한 흑마법사", "헬창2"],
    ]
    let contentAuthors = [
        ["머슬러닝 ★9.78", "머슬러닝 ★9.78", "머슬러닝 ★9.78"],
        ["머슬러닝 ★9.78", "머슬러닝 ★9.78", "머슬러닝 ★9.78"],
        ["머슬러닝 ★9.78", "머슬러닝 ★9.78", "머슬러닝 ★9.78"],
        ["머슬러닝 ★9.78", "머슬러닝 ★9.78", "머슬러닝 ★9.78"],
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row } ?? 0
                        let colIndex = row.firstIndex(of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
    let contentNames = [
        ["시대장", "마루는 강쥐", "하루만 시즈가 되고 싶어"],
        ["유사연애", "내가 키운 근육들", "시한부 만들뻔 했어요!"],
        ["사신소년", "선을 넘은 김래원", "한림 체육관"],
        ["맞짱깔래?", "올빼미", "헬창2"],
    ]
    let contentAuthors = [
        ["김시즈 ★9.83", "김시즈 ★9.83", "김시즈 ★9.83"],
        ["김시즈 ★9.83", "김시즈 ★9.83", "김시즈 ★9.83"],
        ["김시즈 ★9.83", "김시즈 ★9.83", "김시즈 ★9.83"],
        ["김시즈 ★9.83", "김시즈 ★9.83", "김시즈 ★9.83"],
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row} ?? 0
                        let colIndex = row.firstIndex (of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
    let contentNames = [
        ["버림받은 왕녀의 은밀한 침실", "제이의 세계", "백수세끼"],
        ["뷰티풀 군바리", "알고지상주의", "시한부 만들뻔 했어요!"],
        ["개발신의 탑", "선을 넘은 김래원", "한림 체육관"],
        ["맞짱깔래?", "올빼미", "신화급 귀속 아이템을 손에 넣었다"],
    ]
    let contentAuthors = [
        ["꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99"],
        ["꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99"],
        ["꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99"],
        ["꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99", "꽃사슴보이이 ★9.99"],
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row} ?? 0
                        let colIndex = row.firstIndex (of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
    let contentNames = [
        ["잪집에는 로꼬 살고있다", "알고 일기", "페페를 죽여줘요"],
        ["뷰티풀 군바리", "알고지상주의", "시한부 만들뻔 했어요!"],
        ["개발신의 탑", "선을 넘은 김래원", "한림 체육관"],
        ["맞짱깔래?", "올빼미", "신화급 귀속 아이템을 손에 넣었다"],
    ]
    let contentAuthors = [
        ["로꼬 ★9.78", "로꼬 ★9.78", "로꼬 ★9.78"],
        ["로꼬 ★9.78", "로꼬 ★9.78", "로꼬 ★9.78"],
        ["로꼬 ★9.78", "로꼬 ★9.78", "로꼬 ★9.78"],
        ["로꼬 ★9.78", "로꼬 ★9.78", "로꼬 ★9.78"],
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row} ?? 0
                        let colIndex = row.firstIndex (of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
    let contentNames = [
        ["김다빈형님", "숙제 안해오면 몽둥이", "김다빈, 전설이 되다"],
        ["나랑 Xcode 할래?", "알고지상주의", "시한부 만들뻔 했어요!"],
        ["개발신의 탑", "선을 넘은 김래원", "한림 체육관"],
        ["맞짱깔래?", "대충 해도 코딩잘함", "신화급 귀속 아이템을 손에 넣었다"],
    ]
    let contentAuthors = [
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row} ?? 0
                        let colIndex = row.firstIndex (of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
    let contentNames = [
        ["김다빈형님", "싸움못함", "퇴학용병"],
        ["약한하명관", "알고지상주의", "투신 잔챙이"],
        ["사형하명관", "일타강사 하사부", "한림 체육관"],
        ["무직백수 하 명 관?", "사랑받는 시집살이", "고백 받을 수 있긴 하나?"],
    ]
    let contentAuthors = [
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
        ["김다빈 ★9.88", "김다빈 ★9.88", "김다빈 ★9.88"],
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(imageNames, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { imageName in
                        let rowIndex = imageNames.firstIndex { $0 == row} ?? 0
                        let colIndex = row.firstIndex (of: imageName) ?? 0
                        extractButton(imageName, contentNames[rowIndex][colIndex], contentAuthors[rowIndex][colIndex])
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
        NewdayView()
    }
}
