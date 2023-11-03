//
//  ex2.swift
//  ex_11_1_navigation
//
//  Created by 김성엽 on 11/1/23.
//Navigation 예제 02
//SwiftUI에서 NavigationStack을 사용하여
//
//첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면에 전달된 데이터를 표시하고,
//
//두 번째 화면에서 데이터를 수정할 수 있도록 하는 코드를 작성하세요.
//
//단, 수정된 데이터는 첫 번째 화면에도 반영되어야 합니다.

import SwiftUI

struct ex2: View {
    
    @State var data = "Hello"

        var body: some View {
            NavigationStack {
                VStack {
                    Text(data)
                    NavigationLink(destination: SecondView2(data: $data), label: {Text("Go...")})
                }
            }

        }
    }

    struct SecondView2: View {

        @Binding var data: String

        var body: some View {
            VStack {
                Text(data)
                TextField("여기에 입력", text: $data)
            }

        }
    }

#Preview {
    ex2()
}
