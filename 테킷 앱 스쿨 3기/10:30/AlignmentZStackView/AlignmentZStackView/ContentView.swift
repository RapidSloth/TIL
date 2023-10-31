//
//  ContentView.swift
//  AlignmentZStackView
//
//  Created by 김성엽 on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }
    //위에서 정의하고 여기에서 등록하는거 필수
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

//294p
extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    private enum myVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    //위에서 정의하고 여기에서 등록하는거 필수
    static let myAlignment = VerticalAlignment(myVertical.self)
}

// 295p
extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}



//struct ContentView: View {
//    var body: some View {
//        HStack(alignment: .crossAlignment, spacing: 20) {
//            Circle()
//                .foregroundColor(.purple)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                .alignmentGuide(.crossAlignment, computeValue: { d in
//                    d[VerticalAlignment.center]
//                })
//            VStack {
//                Rectangle()
//                    .foregroundColor(.green)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundColor(.blue)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundColor(.red)
//                    .frame(width: 100, height: 100)
//                    .alignmentGuide(.crossAlignment, computeValue: { d in
//                        d[VerticalAlignment.center]
//                    })
//                Rectangle()
//                    .foregroundColor(.yellow)
//                    .frame(width: 100, height: 100)
//            }
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    var body: some View {
        // 아래로 갈수록 위에 쌓임
        ZStack(alignment: Alignment.myAlignment) {
            Rectangle()
                .foregroundColor(.green)
                .alignmentGuide(HorizontalAlignment.myAlignment) { d in
                    d[.trailing]
                }
                .alignmentGuide(VerticalAlignment.myAlignment) { d in
                    d[.bottom]
                }
                .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(HorizontalAlignment.myAlignment) { d in
                    d[HorizontalAlignment.center]
                }
                .alignmentGuide(VerticalAlignment.myAlignment) { d in
                    d[VerticalAlignment.top]
                }
                .frame(width: 100, height: 100)
            Circle()
                .foregroundColor(.orange)
                .alignmentGuide(HorizontalAlignment.myAlignment) { d in
                    d[HorizontalAlignment.leading]
                }
                .alignmentGuide(VerticalAlignment.myAlignment) { d in
                    d[VerticalAlignment.bottom]
                }
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    ContentView()
}
