//
//  ex1.swift
//  ex_10_30
//
//  Created by 김성엽 on 10/30/23.
//

import SwiftUI

// 방법 1
// 반복되는 수정자 묶음은 익스텐션으로 함수추가 가능
extension Image {
    func imageModifier () -> some View {
        self
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.blue, lineWidth: 2)
            }
            .frame(width: 100, height: 100)
    }
}
    
    extension Button {
        func bModifier() -> some View {
            self
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
        }
    }

// 방법 2
// 반복되는 애를 아예 뷰로 묶어서 계속실행
struct CircleIamgeView: View {

    var body: some View {
        Image("sloth")
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.blue, lineWidth: 2)
            }
            .frame(width: 100, height: 100)
    }
}

//실제로 프로젝트를 할 때는 한 가지 방식만 사용하기
// 의도 -> 보는사람이 편하도록 통일성 갖기



struct ex1: View {
    

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                CircleIamgeView()
                Spacer()
            }
        }
        
        HStack() {
            CircleIamgeView()
            CircleIamgeView()
            CircleIamgeView()
        }
        .padding()
        
        HStack() {
            CircleIamgeView()
            CircleIamgeView()
            CircleIamgeView()
        }
        .padding()
        
        Spacer()
        
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Button("BUTTON") {}
                .bModifier()
            Spacer()
            Button("BUTTON") {}
                .bModifier()
            Spacer()
            Button("BUTTON") {}
                .bModifier()
        }
    }
}


#Preview {
    ex1()
}
