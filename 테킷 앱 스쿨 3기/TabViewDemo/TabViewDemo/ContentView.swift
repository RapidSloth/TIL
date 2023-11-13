//
//  ContentView.swift
//  TabViewDemo
//
//  Created by 김성엽 on 11/9/23.
//

import SwiftUI

//탭 아이템에 태그 추가 (고유한 값을 갖는 태그를 할당)
//
//현재의 선택을 저장하기 위한 상태 프로퍼티를 선언
//상태 프로퍼티를 이용하여 역으로 탭 뷰 전환이 가능
struct TabViewDemoView: View {

    @State private var selection = 3

    var body: some View {

        Text("\(selection)")

        // TabView 콘텐트 추가
        TabView(selection: $selection) {
            Text("First Content view")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }.tag(1)

            Text("Second Content view")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Tow")
                }.tag(2)

            Text("Third Content view")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }.tag(3)
        }
        .font(.largeTitle)
        // 뷰 페이징
        // 탭 아이템 추가시 시각적 표시 제공을 위해 tabViewStyle() 수정자를 제거
        // tabItem() 수정자를 사용하여 각 콘텐트 뷰에 탭 아이템을 적용
        .tabViewStyle(PageTabViewStyle())  //가로 스크롤 적용
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    TabViewDemoView()
}
