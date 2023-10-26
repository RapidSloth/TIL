//
//  ResponseHelpers.swift
//  apiTest
//
//  Created by 김성엽 on 2023/10/25.
//

import Foundation
import Alamofire

let headers: HTTPHeaders = [
    "Accept": "application/json"
]

let geturlString1 = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=10"

let geturlString2 =
"https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=midd_list&perPage=10"

let geturlString3 = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=10"


struct schoolData: Codable {
    let dataSearch: DataSearch
}

struct DataSearch: Codable {
    let content: [Content]
}

struct Content: Codable {
    let link: String
    let adres, schoolName, region, totalCount: String
    let estType, seq: String
}
