//
//  schoolDetail.swift
//  ListTutorial
//
//  Created by 김성엽 on 11/2/23.
//

import SwiftUI

struct schoolDetail: View {
    let selectedSchool: School

    
    var body: some View {
        Form {
            Section {
                Text(selectedSchool.schoolName)
                    .font(.headline)
                Text(selectedSchool.adres)
                    .font(.body)
                Link("학교 홈페이지로 이동", destination: URL(string: selectedSchool.link)!)
            }
            
        }
    }
}
