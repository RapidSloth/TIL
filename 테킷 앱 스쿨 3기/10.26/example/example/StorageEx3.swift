//
//  StorageEx3.swift
//  example
//  Created by 김성엽 on 2023/10/26.

//SceneStorage 또는 AppStorage 를 사용하여 사용자의 이름을 저장하고,
//텍스트 필드에 입력하면 자동으로 업데이트 되는 코드를 작성하세요.

import SwiftUI

struct StorageEx3: View {
    
    @AppStorage("my name") var myName = ""
    @State var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField(text: $name) {
                    Text("이름을 입력하세요")
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                Button(action: {postName()}, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                .buttonStyle(.borderedProminent)
                .padding(30)
            }
            Text(myName)
        }
        
        
    }
    
    func postName() {
        myName = name
    }
    
    
}

#Preview {
    StorageEx3()
}
