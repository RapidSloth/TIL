//
//  ContentView.swift
//  ex_10_30
//
//  Created by 김성엽 on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {

            VStack {
                NavigationLink("예제 1", destination: ex1())
                    .padding()
                    .background(.black)
                    .font(.largeTitle)
                NavigationLink("예제 2", destination: ex2())
                    .padding()
                    .background(.black)
                    .font(.largeTitle)
            }
            .frame(width: 500, height: 300)
            .foregroundColor(.white)
            .background(.orange)
        }
    }
}

#Preview {
    ContentView()
}
