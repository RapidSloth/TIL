//
//  school.swift
//  ListTutorial
//
//  Created by 김성엽 on 11/2/23.
//

import Foundation

let hSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=10"

struct schoolData: Codable {
    var dataSearch: DataSearch
}

struct DataSearch: Codable {
    var content: [School]
}

struct School: Codable {
    var id: UUID? = UUID()
    var link: String
    var adres: String
    var schoolName: String
    var region: String
    var totalCount: String
    var estType: String
    var seq: String
}
//
//struct School: Codable, Identifiable {
//    var id: String
//    var link: String
//    var schoolGubun: String
//    var adres: String
//    var schoolName: String
//    var region: String
//    var totalCount: String
//    var estType: String
//    var seq: String
//    var img: String
//}

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // Bundle 에서 파일이름을 통하여 파일의 주소를 가져온다.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        // 위에서 가져온 주소를 활용하여 Data structure 의 객체를 생성한다.
        // 이는 데이터를 Json decoding 에 활용할 수 있도록 하는 작업이라고 볼 수 있다.
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        // parse the data
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
    
}
