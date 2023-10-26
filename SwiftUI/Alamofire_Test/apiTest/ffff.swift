//
//  ffff.swift
//  apiTest
//
//  Created by 김성엽 on 2023/10/23.
//

import Foundation
import Alamofire



//struct RootStruct: Codable {
//    let dataSearch: DataSearch
//}
//
//struct DataSearch: Codable {
//    let content: [Content]
//}
//
//struct Content: Codable {
//    let link: String
//    let adres, schoolName, region, totalCount: String
//    let estType, seq: String
//}
//
//func fetchSchool() {
//    let url = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=10"
//    let request = AF.request(url)
//    request.responseDecodable(of: RootStruct.self) { (response) in
//      guard let schools = response.value else { return }
//        print(schools.dataSearch.content[0].adres)
//    }
//}

