//
//  ContentView.swift
//  ListTutorial
//
//  Created by 김성엽 on 11/2/23.
//

import SwiftUI

class SchoolStore: ObservableObject {
    @Published var schools : [School]
    
    init(schools: [School] = []) {
        self.schools = schools
    }
    
    func loadData() async {
      guard let url = URL(string: hSchoolUrl) else {
        print("Invalid URL")
        return
      }
      
      do {
      let (data, meta) = try await URLSession.shared.data(from: url)
      print(meta)
      if let decodedResponse = try? JSONDecoder().decode(schoolData.self, from: data) {
          schools = decodedResponse.dataSearch.content
        }
      } catch {
        print("Invalid data")
      }
    }
}



struct ContentView: View {
    
    @State var results = [School]()
    @StateObject var result2 = SchoolStore()
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach(0..<results.count, id: \.self){ i in
                    NavigationLink (value: i){
                        ExtractedView(school: result2.schools[i])
                    }
                }
                .onDelete(perform: deleteitems)
                .onMove(perform: moveItems)
                
            }
            .task {
                await loadData()
            }
            .navigationDestination(for: Int.self) { i in
                schoolDetail(selectedSchool: result2.schools[i])
            }
            .navigationDestination(for: String.self) { _ in
                addSchool(results2: self.result2 , path: $stackPath)
            }
            .navigationTitle(Text("High Schools"))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value: "학교 추가") {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        
    }
    
    
    func deleteitems(at offsets: IndexSet ) {
        result2.schools.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destinateion: Int) {
        result2.schools.move(fromOffsets: source, toOffset: destinateion)
    }
  
  func loadData() async {
    guard let url = URL(string: hSchoolUrl) else {
      print("Invalid URL")
      return
    }
    
    do {
    let (data, meta) = try await URLSession.shared.data(from: url)
    print(meta)
    if let decodedResponse = try? JSONDecoder().decode(schoolData.self, from: data) {
        results = decodedResponse.dataSearch.content
        result2.schools = decodedResponse.dataSearch.content
      }
    } catch {
      print("Invalid data")
    }
  }
}

struct ExtractedView: View {
    var school: School
    
    var body: some View {
        HStack {
            Image("\(school.schoolName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(school.schoolName)
                .font(.headline)
        }
    }
}
