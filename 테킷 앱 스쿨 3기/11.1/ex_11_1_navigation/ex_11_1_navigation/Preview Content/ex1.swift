//
//  ex1.swift
//  ex_11_1_navigation
//
//Navigation 예제 01
//SwiftUI에서 NavigationStack을 사용하여
//
//첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 타이틀을 "Second View"로 설정하고,
//
//두 번째 화면에서 첫 번째 화면으로 돌아갈 때, 첫 번째 화면의 타이틀을 "First View"로 변경하는 코드를 작성하세요.


import SwiftUI

struct ex1: View {
    @State var title = "First View"

       var body: some View {
           NavigationStack {
               VStack {
                   Text(title)
                   NavigationLink(destination: SecondView(title: $title), label: {Text("Go...")})
               }
           }

       }
   }

   struct SecondView: View {

       @Binding var title: String

       var body: some View {
           VStack {
               Text(title)
           }
           .onAppear {
               title = "Second View"
           }
           .onDisappear {
               title = "First View"
           }
           .navigationTitle("Second View")
       }
   }

#Preview {
    ex1()
}
