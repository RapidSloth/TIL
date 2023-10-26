//
//  StorageEx1.swift
//  example
//
//  Created by 김성엽 on 2023/10/26.
//
//첫 화면에 컬러 피커로 사용자 색상 선택이 가능
//두 번째 화면 바탕색을 선택한 색으로 채움
//앱을 종료 후 다시 실행하면 선택한 색상으로 복원


import SwiftUI

struct StorageEx1: View {
     var bgColor = Color.white
    
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem{
                    Image(systemName: "01.circle")
                    Text("First")
                }
            
            SecondTabView()
                .tabItem{
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    StorageEx1()
}
