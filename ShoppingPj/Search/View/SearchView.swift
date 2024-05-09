//
//  SearchView.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import SwiftUI

struct SearchView: View {
    
    @State
    private var str = ""
    
    @StateObject
    var viewModel = SearchViewModel()
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)

    var body: some View {
        NavigationStack {
            VStack {
                createHeaderViews()
                    
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(Array(viewModel.output.outputRecentSearch.enumerated()), id: \.offset) { index, searchText in
                        recentSearchViews(text: searchText.searchText, index: index)
                    }
                })
                
            }.navigationTitle("떠나고싶은 고래밥님의 새싹쇼핑").navigationBarTitleDisplayMode(.inline)
            Spacer()
            
        }
        .searchable(text: $str, placement: .navigationBarDrawer(displayMode: .always),prompt: "브랜드, 상품, 프로필, 태그 등")
        .onSubmit(of: .search) {
            viewModel.input.searchText.send(str)
        }
    }
    
}

extension SearchView {
    private func createHeaderViews() -> some View {
        var topHeaderView: some View = HStack {
                Text("최근 검색")
                    .foregroundStyle(.black)
                    .bold()
                Spacer()
                Text("모두 지우기").asPointButton {
                    viewModel.input.deleteAll.send(())
                }
            }.padding(.horizontal, 10)
        
        return topHeaderView
    }
    
    private func recentSearchViews(text: String, index: Int) -> some View {
        
        let recentSearchView: some View = HStack {
            Image(systemName: "magnifyingglass")
            Text(text)
            Spacer()
            Button(action: {
                viewModel.input.deleteRecent.send(index)
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.gray)
            })
        }.padding(.horizontal, 10)
        
        return recentSearchView
    }
}
