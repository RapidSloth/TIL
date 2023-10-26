//
//  File.swift
//  apiTest
//
//  Created by 김성엽 on 2023/10/21.
//func parseJSON(jsonString: String) {
//    do {
//        // JSON 데이터를 Foundation 객체로 파싱
//        if let jsonData = jsonString.data(using: .utf8),
//           let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
//            // 파싱된 JSON 데이터를 배열로 가져오기
//            for item in jsonArray {
//                if let schoolName = item["schoolName"] as? String {
//                    // 배열의 각 요소에서 필요한 데이터를 추출하여 사용
//                    print("Name: \(schoolName)")
//                }
//            }
//        }
//    } catch {
//        print("Error parsing JSON: \(error.localizedDescription)")
//    }
//}
//
//import Foundation
//import Alamofire
//
//struct SchooldataSearch: Codable {
//    var dataSearch: Schoolcontent
//}
//
//struct Schoolcontent: Codable {
//    var content: Schools
//}
//
//struct Schools: Codable  {
//    let urls : Array<String>
//}
//
//
//
//class SchoolViewModel: ObservableObject {
//    @Published var school = [Schools]()
//    @Published var name = [Schools]()
//    @Published var region = [Schools]()
//
//    func fetchSchools() {
//        let url = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=1000000"
//        AF.request(url)
//            .responseDecodable(of: [Schools].self) { data in
//                guard let data = data.value else  { return }
//                self.school = data
//            }
//    }
//}
