//
//  ex4.swift
//  ex_10_31
//
//  Created by 김성엽 on 11/1/23.
//

import SwiftUI

struct ex4: View {
    
    @State private var toggleStatus1 = false
    @State private var toggleStatus2 = false
    @State private var toggleStatus3 = false
    @State private var toggleStatus4 = false
    
    var body: some View {
        NavigationStack{
            List {
                Toggle(isOn: $toggleStatus1, label: {
                    if toggleStatus1 == false {
                        Text("Item 1")
                    } else {
                        Text("Item 1")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                })
                Toggle(isOn: $toggleStatus2, label: {
                    if toggleStatus2 == false {
                        Text("Item 2")
                    } else {
                        Text("Item 2")
                            .fontWeight(.bold)
                    }
                })
                Toggle(isOn: $toggleStatus3, label: {
                    if toggleStatus3 == false {
                        Text("Item 3")
                    } else {
                        Text("Item 3")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                })
                Toggle(isOn: $toggleStatus4, label: {
                    if toggleStatus4 == false {
                        Text("Item 4")
                    } else {
                        Text("Item 4")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                })
            }
            .navigationTitle("SwiftUI List Quiz")
        }
    }
}

#Preview {
    ex4()
}
