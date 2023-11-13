//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by 김성엽 on 11/9/23.
//
/*
 ContextMenu
 사용자가 뷰를 롱프레스 했을 때 나타나는 메뉴
 일반적으로 Text, Image와 함께 선택했을 때 동작을 수행하도록 Button 뷰를 포함
 
 
 */



import SwiftUI

struct ContentView: View {
    
    @State private var forgroundColor: Color = .black
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .font(.largeTitle)
            .foregroundStyle(forgroundColor)
            .background(backgroundColor)
            .contextMenu {
                Button {
                    self.forgroundColor = .black
                    self.backgroundColor = .white
                } label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                }
                Button {
                    self.forgroundColor = .white
                    self.backgroundColor = .black
                } label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                }
            }// contextMenu
    }
}

#Preview {
    ContentView()
}
