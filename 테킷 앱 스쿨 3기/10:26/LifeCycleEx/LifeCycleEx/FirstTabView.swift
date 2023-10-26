//
//  FirstTabView.swift
//  LifeCycleEx
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct FirstTabView: View {
    
    @State var title = "View One"
    
    var body: some View {
        Text(title) // 수정 안하고 사용할거라 $ 필요 없음
            .onAppear(perform: {
                debugPrint("onAppear triggered")
            })
            .onDisappear(perform: {
                debugPrint("onDisappeared triggered")
            })
            .task(priority: TaskPriority.background) {
                title = await changeTitle()
                
            }
    }
    
    func changeTitle() async -> String {
        sleep(5)// 5초 지연
        return "비동기 처리 완료"
    }
    
}

#Preview {
    FirstTabView()
}
