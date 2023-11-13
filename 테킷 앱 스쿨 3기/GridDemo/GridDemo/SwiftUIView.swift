//
//  SwiftUIView.swift
//  ContextMenuDemo
//
//  Created by 김성엽 on 11/9/23.
//

import SwiftUI

struct ContentView1: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: nil,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(header:
                                Text("섹션 1")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                            
                    ) {
                        ForEach(0..<50) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                                .frame(height: 150)
                        }
                    }
                    Section(header:
                                Text("섹션 2")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                            
                    ) {
                        ForEach(0..<50) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                                .frame(height: 150)
                        }
                    }
                })
        }
    }
}


#Preview {
    ContentView1()
}
