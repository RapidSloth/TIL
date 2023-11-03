//
//  addSchool.swift
//  ListTutorial
//
//  Created by 김성엽 on 11/3/23.
//

import SwiftUI

struct addSchool: View {
    
    @StateObject var results2: SchoolStore
    @Binding var path: NavigationPath
    
    @State private var schoolName: String = ""
    @State private var adres: String = ""
    @State private var link: String = ""
    
    var body: some View {
        Form {
            Section {
                Image(systemName: "building.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "학교 이름", userInput: $schoolName)
                DataInput(title: "주소", userInput: $adres)
                DataInput(title: "링크", userInput: $link)
                
            } header: {
                Text("학교 정보")
            }
        }
        
        Button {
            addnewSchool()
        } label: {
            Text("학교 추가")
        }
        .buttonStyle(.borderedProminent)
    }
    
    func addnewSchool() {
        // .uuidString -> id값을 스트링으로 변환해서 넣어준다는 의미
        let newSchool = School(id: UUID(), link: link, adres: adres, schoolName: schoolName, region: adres, totalCount: adres, estType: adres, seq: adres)
        
        results2.schools.append(newSchool)
        
        // 현재화면을 없애고 자동으로 이전 화면으로 가게하는거
        path.removeLast()
    }
}

struct DataInput : View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack{
            Text(title)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
