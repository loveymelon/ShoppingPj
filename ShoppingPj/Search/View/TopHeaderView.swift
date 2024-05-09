//
//  TopHeaderView.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import SwiftUI

struct TopHeaderView: View {
    
    @StateObject
    var viewModel: SearchViewModel
    
    var body: some View {
        HStack {
            Text("최근 검색")
                .foregroundStyle(.black)
                .bold()
            Spacer()
            Text("모두 지우기").asPointButton {
                viewModel.input.deleteAll.send(())
            }
        }.padding(.horizontal, 10)
    }
    
}
