//
//  ContentView.swift
//  GridDemo
//
//  Created by 김성엽 on 11/8/23.
//



import SwiftUI

struct ContentView: View {
    private var colors: [Color] = [.blue, .yellow, .green]
    // flexible 모드는 디폴트로 생략가능
    private var gridItems = [GridItem(),
                             GridItem(.flexible()),
                             GridItem(),
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
            .padding()
        } // ScrollView
    }
}


// 셀 동작하는 커스텀 뷰를 추가 p.367
struct CellContent: View {

    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .cornerRadius(8)
            .font(.largeTitle)
    }
}


#Preview {
    ContentView()
}
