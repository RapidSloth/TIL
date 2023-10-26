//
//  SecondTabView.swift
//  example
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct SecondTabView: View {
    var body: some View {
        VStack {
            Text("첫 화면에 컬러 피커로 사용자 색상 선택이 가능, 두 번째 화면 바탕색을 선택한 색으로 채움 앱을 종료 후 다시 실행하면 선택한 색상으로 복원")
                .frame(width: .infinity, height: 500, alignment: .leading)
                .font(.title)
            Spacer()
            
            Text("Second View")
                .padding(30)
                .font(.largeTitle)
            Spacer()
        }.background(.orange)
    }
}

#Preview {
    SecondTabView()
}
