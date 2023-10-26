//
//  LifeCycleExApp.swift
//  LifeCycleEx
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

@main
struct LifeCycleExApp: App {
    // 현재 화면의 상태를 저장하기 위한 @Environment 속성
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase, _ in
            switch phase {
            case .active:
                debugPrint("활성화")
            case.inactive:
                debugPrint("비활성화")
            case.background:
                debugPrint("백그라운드")
            default:
                debugPrint("Unknown scenephase")
            }
        }
    }
}
