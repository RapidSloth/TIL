//
//  ex4.swift
//  ex_10_30
//
//  Created by 김성엽 on 10/30/23.
//
//다음 코드는 ZStack을 사용하여 두 개의 Rectangle 뷰를 겹치게 하려고 합니다.
//alignment 매개변수를 사용하여 첫 번째 Rectangle 뷰가 왼쪽 상단에, 두 번째 Rectangle 뷰가 오른쪽 하단에 위치하도록 코드를 수정해보세요.

import SwiftUI



struct ex4: View {
    var body: some View {
        ZStack {
            Rectangle()
            Rectangle()
        }
    }
}

#Preview {
    ex4()
}
