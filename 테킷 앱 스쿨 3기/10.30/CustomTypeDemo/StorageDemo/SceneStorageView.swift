//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct SceneStorageView: View {
    
    // 키값 설정
    @SceneStorage("mytext") private var editorText = ""
    
    var body: some View {
        TextEditor(text:  $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
