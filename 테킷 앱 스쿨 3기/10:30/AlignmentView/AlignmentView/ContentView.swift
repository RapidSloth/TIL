//
//  ContentView.swift
//  AlignmentView
//
//  Created by 김성엽 on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum OneThird: AlignmentID { // 확장할때는 해당 프로토콜 채택하기
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}


struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            // 컨테이너 정렬 VStack
            VStack(alignment: .trailing) {
                Text("This is some text")
                Text("This is some loger text")
                Text("This is short")
            }
            // 컨테이너 정렬 HStack
            HStack(alignment:.lastTextBaseline, spacing: 40) {
                Text("This is some text")
                    .font(.largeTitle)
                Text("This is some loger text")
                    .font(.body)
                Text("This is short")
                    .font(.headline)
            }
            // 정렬 가이드
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        120.0
                    })
                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        d[HorizontalAlignment.trailing] + 50
                    })
            }
            //커스텀 정렬 타입
            HStack(alignment: .oneThird) {
                Rectangle()
                    .foregroundStyle(.green)
                    .frame(width: 50, height: 100)
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: 50, height: 100)
                    .alignmentGuide(.oneThird, computeValue: { d in
                        d[VerticalAlignment.top] // top을 기준으로 3분의1부터 아래로
                    })
                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(width: 50, height: 100)
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: 50, height: 100)
                    .alignmentGuide(.oneThird, computeValue: { d in
                        d[VerticalAlignment.bottom] // bottom을 기준으로 3분의 1부터 위로
                    })
            }
        }
    }
}

#Preview {
    ContentView()
}
