//
//  File2.swift
//  apiTest
//
//  Created by 김성엽 on 2023/10/23.
//
//
//import Foundation
//import Alamofire
//import SwiftUI
//
//
//// alamofire 동시성
//private let HighSchool_URL = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=1000000"
//
//final class AppNetworking {
//    static let shared = AppNetworking()
//
//    private init() { }
//
//    private let session: Session = {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 10
//        configuration.timeoutIntervalForResource = 10
//        return Session(configuration: configuration)
//    }()
//
//    func requestJSON<T: Decodable>(_ url: String,
//                                   type: T.Type,
//                                   method: HTTPMethod,
//                                   parameters: Parameters? = nil) async throws -> T {
//
//        return try await session.request(url,
//                                         method: method,
//                                         parameters: parameters,
//                                         encoding: URLEncoding.default)
//        .serializingDecodable()
//        .value
//    }
//}
//
//
//
//private func retrieveJokes(url: String) async {
//    do {
//        let data = try await AppNetworking.shared.requestJSON(url,
//                                                               type: schoolData.self,
//                                                               method: .get,
//                                                               parameters: nil)
//        Highschools = data.dataSearch.content
//    } catch {
//        print("Error")
//    }
//}
//
