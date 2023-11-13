//
//  ex1.swift
//  GridDemo
//
//  Created by 김성엽 on 11/9/23.
//

import SwiftUI

struct ex1: View {
    
    @State private var slider = 1.0
    
    var body: some View {
        
        VStack {
            Slider(value: $slider, in: 1...5, step: 1)
            
            Spacer()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: Int(slider)), spacing: 5) {
                ForEach((0...4), id: \.self) { _ in
                    CellContent(index: 1, color: .red)
                }
            }
            Spacer()
        }
        
    }
}

#Preview {
    ex1()
}
