//
//  ContentView.swift
//  ex_10_31
//
//  Created by 김성엽 on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                NavigationLink(destination: ex1()) {
                    Text("예제 1")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
