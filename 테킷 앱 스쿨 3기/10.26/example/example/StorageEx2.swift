//
//  StorageEx2.swift
//  example
//
//  Created by 김성엽 on 2023/10/26.
//SceneStorage 또는 AppStorate 를 사용하여 탭바 뷰의 선택된 인덱스를 저장하고,

//앱이 백그라운드로 또는 전 화면으로 돌아갔다가 다시 활성화될 때 복원하는 코드를 작성하세요.

import SwiftUI

struct StorageEx2: View {
    
    @SceneStorage("originText") var ttext = "기본값"
    
    var body: some View {
        TextEditor(text: $ttext)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    StorageEx2()
}
