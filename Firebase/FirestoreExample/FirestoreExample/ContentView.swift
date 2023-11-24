//
//  ContentView.swift
//  FirestoreExample
//
//  Created by 김성엽 on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var firestoreManager: FireStoreManager
     
    var body: some View {
        VStack {
            Text("My Title: \(firestoreManager.freeboardTitle)")
            Text("My Nickname: \(firestoreManager.freeboardNickName)")
        }
    }
}
