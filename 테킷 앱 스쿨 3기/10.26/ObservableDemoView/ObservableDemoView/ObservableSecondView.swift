//
//  ObservableSecondView.swift
//  ObservableDemoView
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct ObservableSecondView: View {
    @EnvironmentObject var timerData: TimerData
    // 첫번째 화면에서만 인스턴스를 만들고 여기에 전달
    // 여기서도 만들면 타이머가 메모리상에서 2개나 돌아가는거임.
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.largeTitle)
        }
    }
}
