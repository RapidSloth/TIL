//
//  ContentView.swift
//  apiTest
//
//  Created by 김성엽 on 2023/10/21.
//
import SwiftUI
import Alamofire

struct ContentView:View {
    
    @State var arr = [String]()
    
    var body: some View {
        VStack{
            Text("123")
        }
        .onAppear {
            Task{
                let value1 = try await fetchSchool1().dataSearch.content.map{$0.schoolName}
                let value2 = try await fetchSchool2().dataSearch.content.map{$0.schoolName}
                let value3 = try await fetchSchool3().dataSearch.content.map{$0.schoolName}
                var arr = value1 + value2 + value3
                debugPrint(arr)
            }
        }
    }
}


// 동시성
func fetchSchool1() async throws -> schoolData{
    return try await AF.request(geturlString1, method: .get, headers: headers).serializingDecodable(schoolData.self).value
}

func fetchSchool2() async throws -> schoolData{
    return try await AF.request(geturlString2, method: .get, headers: headers).serializingDecodable(schoolData.self).value
}

func fetchSchool3() async throws -> schoolData{
    return try await AF.request(geturlString3, method: .get, headers: headers).serializingDecodable(schoolData.self).value
}


#Preview {
    ContentView()
}
