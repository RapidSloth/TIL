//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct UserName: Codable {
    var firstName: String
    var secondName: String
}


struct CustomTypeView: View {
    @AppStorage("mytext") var editorText = "Sample Text"
    @AppStorage("username") var namestore: Data = Data()
    
    @State var username = UserName(firstName: "kim", secondName: "minsu")

    // init() 넣었더니 세이브 버튼을 눌러도 UserName(firstName: "kim", secondName: "minsu")
    // 이 형태 그대로 출력되는것을 확인.
    // 왜? 시간대가 다르기 때문에. onappear 수정자 아래에 작성했더니 정상적으로 작동했다
    //코드가 실행되는 시점이 다릅니다.
    //init(): 처음 뷰가 만들어질때 실행됨
    //onAppear: 뷰가 만들어지고, 화면에 나타난 뒤 실행됨
    //userName이란 변수가 만들어진 뒤에 onAppear에서 userName에 값을 넣어줘서 하나의 값이 유지됩니다.
    //
    // 앞으로 우리는 어떤 상황... 뷰가 나타났을때라든지 앱이 실행됐을때라든지 이런 것들을 파악해서
    // 어디에 코드를 넣어야하는지 실행시점을 잘 생각하고 작생해야한다.
//    init() {
//        let decoder = JSONDecoder()
//
//        if let name = try? decoder.decode(UserName.self, from: namestore) {
//                username = name
//            editorText = "\(username)"
//        }
//    }
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("firstname", text: $username.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onAppear() {
                        let decoder = JSONDecoder()

                        if let name = try? decoder.decode(UserName.self, from: namestore) {
                                username = name
                            editorText = "\(username)"
                        }
                    }
                TextField("secondname", text: $username.secondName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(username) {
                    namestore = data
                }
            },
                   label: {
                Text("username save")
            })
            
            TextEditor(text: $editorText)
                .padding(30)
            .font(.largeTitle)
        }
        .background(.orange)
    }
}


#Preview {
    CustomTypeView()
}
