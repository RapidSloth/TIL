//
//  carDetail.swift
//  ListNavigationTutorial
//
//  Created by 김성엽 on 11/2/23.
//

import SwiftUI

struct carDetail: View {
    
    let selectedCar: Car
    
    var body: some View {
        
        // 리스트와 거의 같음
        Form {
            Section {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            } header: {
                Text("Car Details")
            }
            
        }
    }
}


#Preview {
    carDetail(selectedCar: carData[0])
}
