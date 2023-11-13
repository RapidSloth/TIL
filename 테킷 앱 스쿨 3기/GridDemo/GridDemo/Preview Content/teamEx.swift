//
//  teamEx.swift
//  GridDemo
//
//  Created by 김성엽 on 11/9/23.
//

import SwiftUI

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...5).map { Photo(name: "animal-\($0)") }
let samplePhotos2 = (6...10).map { Photo(name: "animal-\($0)") }

struct teamEx: View {
    
    @State private var isPhotoVisible = true
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, pinnedViews: .sectionHeaders) {
                    Section(header:
                                Text("동물 피드 1")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                            
                    ){
                        ForEach(samplePhotos.indices, id: \.self) { index in
                            
                            Image(samplePhotos[index].name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: gridLayout.count == 1 ? 200 : 100)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            
                            if isPhotoVisible {
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                                    ForEach(samplePhotos) { photo in
                                        Image(photo.name)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .frame(height: 50)
                                            .cornerRadius(10)
                                    }
                                }
                                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                                .animation(.easeIn, value: gridLayout.count)
                            }
                        }
                    }
                    Section(header:
                                Text("동물 피드 2")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                            
                    ){  /// .indices 해당 배열의 범위  Range(0..<5)
                        ForEach(samplePhotos2.indices, id: \.self) { index in
                            Image(samplePhotos2[index].name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: gridLayout.count == 1 ? 200 : 100)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            
                            if isPhotoVisible {
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                                    ForEach(samplePhotos2) { photo in
                                        Image(photo.name)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .frame(height: 50)
                                            .cornerRadius(10)
                                    }
                                }
                                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                                .animation(.easeIn, value: gridLayout.count)
                            }
                        }
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation {
                                self.isPhotoVisible.toggle()
                            }
                        } label: {
                            Image(systemName: "square.grid.3x1.below.line.grid.1x2")
                                .font(.title)
                        }
                        .tint(.primary)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button {
                            self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title)
                        }
                        .tint(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    teamEx()
}
