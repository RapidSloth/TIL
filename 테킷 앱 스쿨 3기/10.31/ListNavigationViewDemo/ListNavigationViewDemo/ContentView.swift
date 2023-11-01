//
//  ContentView.swift
//  ListNavigationViewDemo
//
//  Created by 김성엽 on 10/31/23.
//
import SwiftUI

// 동적 리스트
// 리스트에 표시할 데이터는 Id... 프로토콜을 따라야 한다.
// 해셔블 프로토콜을 따르는 모든 스위프트 타입이나 커스텀 타입이 가능
// 각 항목을 고유하게 식별하는데 사용
struct ToDoItem: Identifiable, Hashable {
    var id = UUID()
    var task: String
    var imageName: String
}


struct ContentView: View {
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    @State private var toggleStatus = true
    @State private var stackPath = NavigationPath()
    
    
    var body: some View {
        
        Text("\(stackPath.count)")
        NavigationStack(path: $stackPath) {
            // 동적 리스트 ForEach 사용예
            // Section : 특정 보기 내에 계층 구조를 추가하는 데 사용할 수 있는 컨테이너 보기
            List {
                Section(header: Text("Setting")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                }
                
                
                // 어쨌든 이건 첫번째 값을 전달 ->
                // ToDoItem(task: "Take out the trash", imageName: "trash.circle.fill") 얘를 전달한다는 거고, 화면에도 얘가 뜬다.
                // 이 방식을 사용하려면 value 자체가 해셔블 프로토콜을 따르는 친구여야한다는 메세지가 뜸
                // 그래서 위에 있던 listData을 해셔블 프로토콜을 채택하도록 했음.
                // uuid로 인해 형성된 id가 해셔블하긴하지만, ToDoItem자체가 해셔블하지는 않았기에
                // 프로토콜을 채택한 것임.
                NavigationLink(value: listData.first ?? ToDoItem(task: "", imageName: "")) {
                    Text("test")
                }
                
                // 값 타입별 내비게이션
                NavigationLink(value: listData.count) {
                    Text("View Task Count")
                }
                
                Section(header: Text("To Do Tasks")) {
                    ForEach (listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                         // 데이터 소스에서 항목을 삭제하는 코드 p.310
                         print("\(indexSet)")
 //                        for index in indexSet {
 //                            listData.remove(at: index)
 //                        }
                         listData.remove(atOffsets: indexSet)
                     })
                     .onMove(perform: { indices, newOffset in
                         // 항목을 재배열하는 코드 p.311
                         listData.move(fromOffsets: indices, toOffset: newOffset)
                     })
                }
            }
            .navigationTitle("To Do List")
            
            .toolbar{EditButton()}
            
            .navigationDestination(for: ToDoItem.self) { item in
                Text("Number of tasks = \(item.imageName)")
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks = \(count)")
            }
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
            // 새로 고침 동작을 추가
            .refreshable {
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call finacial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
        }
    }
}

#Preview {
    ContentView()
}
