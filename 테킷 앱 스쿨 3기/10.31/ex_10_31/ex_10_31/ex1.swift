//
//  ex1.swift
//  ex_10_31
//
//  Created by 김성엽 on 11/1/23.

//List 를 사용하여 다음과 같은 화면을 구현해보세요.
//화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
//List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트가 있습니다.
//List 의 배경색은 흰색이고, 텍스트의 색은 파란색입니다

import SwiftUI

struct ex1: View {
    var body: some View {
        NavigationStack{
            List {
                Text("Item 1")
                    .foregroundStyle(.blue)
                Text("Item 2")
                    .foregroundStyle(.blue)
                Text("Item 3")
                    .foregroundStyle(.blue)
                Text("Item 4")
                    .foregroundStyle(.blue)
                Text("Item 5")
                    .foregroundStyle(.blue)
                Text("Item 6")
                    .foregroundStyle(.blue)
                Text("Item 7")
                    .foregroundStyle(.blue)
                Text("Item 8")
                    .foregroundStyle(.blue)
                Text("Item 9")
                    .foregroundStyle(.blue)
                Text("Item 10")
                    .foregroundStyle(.blue)
            }
            .navigationTitle("SwiftUI List Quiz")
        }
    }
}

#Preview {
    ex1()
}
