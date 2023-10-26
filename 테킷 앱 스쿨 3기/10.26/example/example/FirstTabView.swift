//
//  FirstTabView.swift
//  example
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct FirstTabView: View {
//    
//    @State private var usSearchTermColor: Color = Color(
//        .sRGB,
//        red: (UserDefaults.standard.object(forKey: "usSearchTermColor") as! [CGFloat])[0],
//        green: (UserDefaults.standard.object(forKey: "usSearchTermColor") as! [CGFloat])[1],
//        blue: (UserDefaults.standard.object(forKey: "usSearchTermColor") as! [CGFloat])[2],
//        opacity: (UserDefaults.standard.object(forKey: "usSearchTermColor") as! [CGFloat])[3]
//    ) {
//        didSet {
//            let components = self.usSearchTermColor.cgColor?.components ?? UIColor.yellow.cgColor.components
//
//            UserDefaults.standard.set(components, forKey: "usSearchTermColor")
//        }
//    }
//    
    var body: some View {
        VStack {
            Text("첫 화면에 컬러 피커로 사용자 색상 선택이 가능, 두 번째 화면 바탕색을 선택한 색으로 채움 앱을 종료 후 다시 실행하면 선택한 색상으로 복원")
                .frame(width: .infinity, height: 500, alignment: .leading)
                .font(.title)
            Spacer()
            Text("First View")
                .padding(30)
                .font(.largeTitle)
            Spacer()
        }.background(.purple)
    }
    
    
    
}






#Preview {
    FirstTabView()
}
