//
//  addNewCar.swift
//  ListNavigationTutorial
//
//  Created by 김성엽 on 11/2/23.
//

import SwiftUI

// 새로운 자동차 추가하는 뷰 설계
struct addNewCar: View {
    
    @StateObject var carStore: CarStore
    @Binding var path: NavigationPath
    
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybird")
                        .font(.headline)
                }
                .padding()
            } header: {
                Text("Car Details")
            }
        }
        
        Button {
            addnewCar()
        } label: {
            Text("Add Car")
        }
        .buttonStyle(.borderedProminent)
    }
    func addnewCar() {
        // .uuidString -> id값을 스트링으로 변환해서 넣어준다는 의미
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carStore.cars.append(newCar)
        
        // 현재화면을 없애고 자동으로 이전 화면으로 가게하는거
        path.removeLast()
    }
}

// 새로운 차량의 상세 정보 입력을 위한 하위 뷰를 선언
struct DataInput : View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack{
            Text(title)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

