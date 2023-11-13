//
//  GridRowDemo.swift
//  GridDemo
//
//  Created by 김성엽 on 11/9/23.
//

import SwiftUI
/**
 # GridRow p.377

 Grid 와 GridRow

 지연 lazy 그리드 뷰가 할 수 없는 열 확장, 빈 셀, 다양한 정렬과 간격 등의 기능을 제공
 */

import SwiftUI

struct GridRowDemoView: View {
    var body: some View {
        // Grid 뷰의 horizontalSpacing:, verticalSpacing: 매개변수를 사용하여 행과 열 사이의 간격 조정
        // Grid 의 alignment: 매개변수에 정렬을 할당
        // GridRow 의 alignment: 매개변수에 정렬을 재정의
        // - gridColumnAlignment() 수정자를 사용하여 개별 열의 셀에 대한 정렬 적용
        // - gridCellAnchor() 수정자를 사용하여 개별 셀의 콘텐트 정렬을 재정의
        Grid(alignment: .topLeading) {

            GridRow(alignment: .bottom) {
                CellContent_1(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.trailing)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.top)
                CellContent_1(index: 0, color: .yellow)
            }
            .font(.largeTitle)

            GridRow(alignment: .top) {
                CellContent_1(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent_1(index: 0, color: .yellow)
            }
            .font(.largeTitle)


            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if (index % 2 == 1) {
                        CellContent_1(index: index, color: .red)
                    } else {
                        // 빈 셀은 clear 색상 같은 구성된 Color 뷰로 표시
                        // gridCellUnsizedAxes() 수정자를 적용하면 빈 셀의 높이와 너비가 == 점유된 셀의 디폴트 높이 또는 너비와 같도록 변경
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }

            // 자동으로 생성되는 빈 그리드 셀
            // 서로 다른 개수를 포함하는 행을 가지는 경우, 가장 긴 행과 일치하도록 짧은 행에 빈 셀이 자동으로 추가
            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent_1(index: index, color: .blue)
                }
            }

            GridRow {
                ForEach(11...12, id: \.self) { index in
                    CellContent_1(index: index, color: .green)
                }
            }

            // GridRow 가 아닌 다른 자식 뷰
            // 그리드 레이아웃 내에서 전체 행을 차지하도록 자동 확장
            // .frame(minWidth: 75, maxWidth: .infinity, minHeight: 100)
            CellContent_1(index: 16, color: .blue)

            // 열 확장하기 p.382
            // - gridCellColumns() 수정자를 적용하여 단일 셀이 지정된 수의 열에 놓일 수 있도록 적용
            GridRow {
                CellContent_1(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent_1(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }

        } // Grid
        .padding()
    }
}

// 셀 동작하는 커스텀 뷰를 추가(프로젝트에 이미 추가되어 있음) p.378
struct CellContent_1: View {
    var index: Int
    var color: Color

    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.largeTitle)
    }
}

#Preview {
    GridRowDemoView()
}
