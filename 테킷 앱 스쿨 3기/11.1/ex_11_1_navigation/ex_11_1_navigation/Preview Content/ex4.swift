//
//  ex4.swift
//  ex_11_1_navigation
//
//  Created by 김성엽 on 11/1/23.
//Navigation 예제 04
//SwiftUI에서 NavigationStack을 사용하여
//
//첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 네비게이션 바에 "Edit" 버튼을 추가하고,
//
//버튼을 누르면 텍스트 필드가 편집 가능하도록 하는 코드를 작성하세요.
//
//텍스트 필드의 초기값은 "Hello"입니다.

import SwiftUI

struct ex4: View {
    @State var data = "Hello"

        var body: some View {
            NavigationStack {
                VStack {
                    Text(data)
                    NavigationLink(destination: SecondView4(data: $data), label: {Text("Go...")})
                }
            }

        }
    }

    struct SecondView4: View {

        @Binding var data: String
        @State var isEditing = false

        var body: some View {
                VStack {
                    Spacer()
                    TextField("여기에 입력", text: $data)
                        .disabled( !isEditing )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(isEditing ? .black : .mint, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .background(.white)
                .navigationBarBackButtonHidden(false)
                .toolbar {
                    Button(action: {
                        isEditing.toggle()
                    }, label: {
                        Text(isEditing ? "Done" : "Edit")
                    })
                }
                .padding()
        }
    }
#Preview {
    ex4()
}
