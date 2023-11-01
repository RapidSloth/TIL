//
//  ex2.swift
//  ex_10_30
//
//  Created by 김성엽 on 10/30/23.
//

import SwiftUI


struct ex2: View {
   
    @State private var icup = "square.and.arrow.up"
    @State private var icdown = "square.and.arrow.down"

    var body: some View {
        VStack {
            Image(systemName: icup)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Spacer()

            HStack {
                Spacer()

                Button("UP") {
                    // down 이미지 일때 위치 바꾸기
                    if icup.hasSuffix("down") { (icup, icdown) = (icdown, icup) }
                }
                .bModifier()

                Spacer()

                Button("DOWN") {
                    // up 이미지 일때 위치 바꾸기
                    if icup.hasSuffix("up") { (icup, icdown) = (icdown, icup) }
                }
                .bModifier()

                Spacer()
            }

            Spacer()
            Image(systemName: icdown)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
    }
}
#Preview {
    ex2()
}
