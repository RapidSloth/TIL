//
//  ContentView.swift
//  ListNavigationTutorial
//
//  Created by 김성엽 on 11/2/23.
//

import SwiftUI

//JSON 데이터 로딩
var carData: [Car] = loadJson("carData.json")

// 데이터 저장소 구조체를 추가
class CarStore : ObservableObject {
    @Published var cars: [Car]
    
    // init하고 엔터하면 나오는 친구
    // 기본값이 없으므로 초기화가 필요하기 때문에 해줘야함
    // []는 값이 없을 때 빈배열을 추가하라는 코드
    init(cars: [Car] = []) {
        self.cars = cars
    }
}


// 사용자 인터페이스 콘텐트 뷰 설계
struct ContentView: View {
    @StateObject var carStore = CarStore(cars: carData)
    // add car 버튼 클릭시 무반응 -> 사용자는 계속클릭해서 계속 추가하는 이런 일 방지 위해
    // 눌렀을때 특정 화면으로 이동하게
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath){
            List {
                ForEach(0..<carStore.cars.count, id: \.self) { i in
                    // 리팩토링?
                    NavigationLink(value: i) {
                        ExtractedView(car: carStore.cars[i])
                    }
                }
                .onDelete(perform: deleteitems)
                .onMove(perform: moveItems)
                
            }
            .navigationDestination(for: Int.self) { i in
                carDetail(selectedCar: carStore.cars[i])
            }
            // value로 string을 받는애는 단 하나이므로 이렇게 해도 인식함
            .navigationDestination(for: String.self) { _ in
                addNewCar(carStore: self.carStore, path: $stackPath)
            }
            .navigationTitle(Text("Ev Cars"))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value: "Add Car") {
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
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destinateion: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destinateion)
    }
    
}

//하위 뷰로 추출
struct ExtractedView: View {
    var car: Car
    
    var body: some View {
        HStack {
            // 원래는 carStore.cars[i].imageName이었던 걸 이렇게.
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 60)
            Text(car.name)
        }
    }
    
}

#Preview {
    ContentView()
}
