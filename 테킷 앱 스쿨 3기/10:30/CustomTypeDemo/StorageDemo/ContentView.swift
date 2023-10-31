//
//  ContentView.swift
//  StorageDemo
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            CustomTypeView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    ContentView()
}
