//
//  ex2.swift
//  ex_10_31
//
//  Created by 김성엽 on 11/1/23.
//List 를 사용하여 다음과 같은 화면을 구현해보세요.
//
//화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
//List 에는 5개의 섹션이 있으며, 각 섹션에는 "Section 1", "Section 2", ... , "Section 5" 라는 헤더가 있습니다.
//각 섹션에는 3개의 행이 있으며, 각 행에는 "Row 1", "Row 2", "Row 3" 이라는 텍스트가 있습니다.
//List 의 배경색은 회색이고, 헤더의 텍스트 색은 검은색, 행의 텍스트색은 파란색입니다.


import SwiftUI


struct row: Identifiable {
    var id = UUID()
    var name: String
}


struct ex2: View {
    
    @State var listData: [row] = [
        row(name: "Row1"),
        row(name: "Row2"),
        row(name: "Row3")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Section 1").foregroundStyle(.black)) {
                    ForEach (listData) { item in
                        
                        Text(item.name)
                            .foregroundStyle(.blue)
                        
                    }
                    .listRowBackground(Color.gray)
                }
                Section(header: Text("Section 2").foregroundStyle(.black)) {
                    ForEach (listData) { item in
                        
                        Text(item.name)
                            .foregroundStyle(.blue)
                        
                    }
                }
                .listRowBackground(Color.gray)
                Section(header: Text("Section 3").foregroundStyle(.black)) {
                    ForEach (listData) { item in
                        
                        Text(item.name)
                            .foregroundStyle(.blue)
                        
                    }
                }
                .listRowBackground(Color.gray)
                Section(header: Text("Section 4").foregroundStyle(.black)) {
                    ForEach (listData) { item in
                        
                        Text(item.name)
                            .foregroundStyle(.blue)
                        
                    }
                }
                .listRowBackground(Color.gray)
                Section(header: Text("Section 5").foregroundStyle(.black)) {
                    ForEach (listData) { item in
                        
                        Text(item.name)
                            .foregroundStyle(.blue)
                        
                    }
                }
                .listRowBackground(Color.gray)
            }
            .navigationTitle("SwiftUI List Quiz")
        }
    }
}

#Preview {
    ex2()
}
