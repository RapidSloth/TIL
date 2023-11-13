//
//  ex2.swift
//  NavigationSplitVIewDemo
//
//  Created by 김성엽 on 11/8/23.
//

import SwiftUI

struct Item2: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var content: String
}

struct ListView: View {
    var items: [Item2]
    @State var selectedItem: Item2?

    var body: some View {
        // 여기에 코드를 작성하세요.
        List(items, id: \.self, selection: $selectedItem) { item in
            Text(item.title).tag(item)
        }
    }
}

struct DetailView: View {
    var item: Item2

    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
            Text(item.content)
                .padding()
        }
    }
}



struct ex2: View {
    // 샘플 데이터
    let items = [
        Item2(title: "첫 번째 항목", content: "이것은 첫 번째 항목입니다."),
        Item2(title: "두 번째 항목", content: "이것은 두 번째 항목입니다."),
        Item2(title: "세 번째 항목", content: "이것은 세 번째 항목입니다."),
        Item2(title: "네 번째 항목", content: "이것은 네 번째 항목입니다."),
        Item2(title: "다섯 번째 항목", content: "이것은 다섯 번째 항목입니다."),
        Item2(title: "여섯 번째 항목", content: "이것은 여섯 번째 항목입니다."),
        Item2(title: "일곱 번째 항목", content: "이것은 일곱 번째 항목입니다."),
        Item2(title: "여덟 번째 항목", content: "이것은 여덟 번째 항목입니다."),
        Item2(title: "아홉 번째 항목", content: "이것은 아홉 번째 항목입니다."),
        Item2(title: "열 번째 항목", content: "이것은 열 번째 항목입니다.")
    ]
    
    @State var selectedIt: Item2?
    
    var body: some View {
        // 여기에 코드를 작성하세요.
        NavigationSplitView {
            ListView(items: items, selectedItem: selectedIt)
        } detail: {
            if let selectedIt {
                DetailView(item: selectedIt)
            }
        }
    }
}

//#Preview {
//    ex2(selectedItem: <#T##Item2#>)
//}
