//
//  ContentView.swift
//  example
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: StorageEx1()) {
                    Text("예제 1")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
                NavigationLink(destination: StorageEx2()) {
                    Text("예제 2")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
                NavigationLink(destination: StorageEx3()) {
                    Text("예제 3")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
