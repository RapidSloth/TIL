//
//  ContentView.swift
//  ObservableDemoView
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI
import Foundation

//timer가 Foundation에 들어있으므로 impoert먼저
// 공유해서 사용할 데이터
class TimerData : ObservableObject {
    // 공유해서 사용할 데이터
    // 얘를 구독해서 사용하는 애들은 모두 이 숫자에 영향을 받게됨
    @Published var timeCount = 0
    var timer: Timer? // 값이 있을수도없을수도있읍니다
    
    // 내부에서 타이머 값을 수정 -> 바뀐 타이머 값에 따라 외부의 애들이 영향을 받는 구조
    init() {
        // 비동기 함수 사용시 시간차 줄때는 보통 앞에서 사용한 sleep이 아니라
        // 이 Timer라는 것을 주로 사용한다.
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timeDidfire),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    //타이머가 끝나면 실행
    // selector에서 요구하는 모양 그대로 @objc func로 만들면 됨
    @objc func timeDidfire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
    
}


struct ContentView: View {
    
    //구독할 곳에서 생성해 줘야함
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("시간 카운터 = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount, label: {
                    Text("시간 초기화")
                })
                
                NavigationLink (destination: ObservableSecondView()){ Text("Next Screen")
                }
                .padding()
            }
        }
        .environmentObject(timerData)
    }
}

#Preview {
    ContentView()
}
