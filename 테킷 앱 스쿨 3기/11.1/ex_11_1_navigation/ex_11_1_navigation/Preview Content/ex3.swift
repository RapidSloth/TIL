//
//  ex3.swift
//  ex_11_1_navigation
//
//SwiftUI에서 NavigationStack을 사용하여
//
//첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 배경색을 파란색으로 설정하고,
//
//두 번째 화면에서 첫 번째 화면으로 돌아갈 수 없도록 하는 코드를 작성하세요.

import SwiftUI

struct ex3: View {
    @State var data = "Hello"

        var body: some View {
            NavigationStack {
                VStack {
                    Text(data)
                    NavigationLink(destination: SecondView3(data: $data), label: {Text("Go...")})
                }
            }

        }
    }

    struct SecondView3: View {

        @Binding var data: String

        var body: some View {
                VStack {
                    Spacer()
                    Text(data)
                    TextField("여기에 입력", text: $data)
                    Spacer()
                }
                .background(.blue)
                .navigationBarBackButtonHidden(true)
        }
    }
#Preview {
    ex3()
}
