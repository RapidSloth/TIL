//
//  SecondTabView.swift
//  LifeCycleEx
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct SecondTabView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
        //교재의 .onChang(of: perform: { valu in 얘는 미지원
        // 이제는 oldValue뿐만 아니라 newValue도 필요함
//            .onChange(of: text) { oldValue, newValue in
//                <#code#>
//            }
            .onChange(of: text) {
                print("onChange triggered")
            } // 앱 내에서 of에 전달한 친구의 상태가 변경될 때마다 실행
            // ScenePhase 환경 프로퍼티와 함께 사용할 때 특히 유용하다.
        
    }
}

#Preview {
    SecondTabView()
}
