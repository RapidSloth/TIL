//
//  schoolVM.swift
//  ListTutorial
//
//  Created by 황성진 on 11/2/23.
//

import Foundation
import SwiftUI
import Alamofire

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
    
}

struct schoolData: Codable {
    var dataSearch: DataSearch
}

struct DataSearch: Codable {
    var content: [School]
}

struct School: Codable {
    var link: String
    var adres: String
    var schoolName: String
    var region: String
    var totalCount: String
    var estType: String
    var seq: String
    var img: String?
    
    static func setImageString(school: School, img: String) -> School {
        var school = school
        school.img = img
        return school
    }
}


var schoolDatas: [School] = loadJson("hschoolList.json")

class SchoolStore: ObservableObject {
    @Published var isDownloading: Bool = true
    
    @Published var schools: [School]
    
    @Published var receivedSchool: [School] = []
    
    @Published var searchResult: [School] = []
    
    @State var progress: Double = 0
    
    init(schools: [School]) {
        self.schools = schools
    }
    
    public func updateSearchText(with text: String) {
        
        if text.count > 0 {
            let tmpSearch = receivedSchool.filter { $0.schoolName.contains(text) }
            searchResult = tmpSearch.filter { school in !schools.contains { $0.adres == school.adres } }
        }
    }
    //    public func updateSearchText(with text: String) {
    //        print(receivedSchool.startIndex)
    //        print(receivedSchool)
    //        if text.count > 0 {
    //            searchResult = receivedSchool.filter { $0.schoolName.contains(text) }
    //        }
    //    }
    
    
    
}
//MARK: Fetch Data
extension SchoolStore {
    func fetchData() async {
        Task {
            do {
                let data1 = try await fetchSchool1().dataSearch.content
                let data2 = try await fetchSchool2().dataSearch.content
                let data3 = try await fetchSchool3().dataSearch.content
                let result = data1 + data2 + data3
                DispatchQueue.main.async {
                    self.receivedSchool = result // Update on the main thread
                    self.isDownloading = false
                }
            } catch {
                print("Error fetching data: \(error)")
         
            }
          
        }
    }
    
    
    func fetchSchool1() async throws -> schoolData{
        return try await AF.request(eSchoolUrl, method: .get, headers: headers).serializingDecodable(schoolData.self).value
    }

    func fetchSchool2() async throws -> schoolData{
        return try await AF.request(mSchoolUrl, method: .get, headers: headers).serializingDecodable(schoolData.self).value
    }

    func fetchSchool3() async throws -> schoolData{
        return try await AF.request(hSchoolUrl, method: .get, headers: headers).serializingDecodable(schoolData.self).value
    }
    

//    private func fetchDataAsync() async throws -> schoolData {
//        guard let url = URL(string: "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=100000") else {
//            throw MyError.invalidURL
//        }
//        let (data, _) = try await URLSession.shared.data(from: url)
//        for i in 1...10 {
//            DispatchQueue.main.async {
//                self.progress = Double(i) / 10.0
//            }
//            try await Task.sleep(nanoseconds: 1) // Simulate a delay
//        }
//        let decodedData = try JSONDecoder().decode(schoolData.self, from: data)
//        return decodedData
//    }
}

enum MyError: Error {
    case invalidURL
}

enum ViewState: String {
    case empty
    case loading
    case ready
    case error
}

let headers: HTTPHeaders = [
    "Accept": "application/json"
]

let eSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=100000"
let mSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=midd_list&perPage=100000"
let hSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=100000"
