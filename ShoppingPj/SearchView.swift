//
//  SearchView.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import SwiftUI

struct SearchData: Identifiable {
    let id = UUID()
    let searchText: String
}

struct SearchView: View {
    
    @State
    private var str = ""
    
    @State
    private var recentSearch: [SearchData] = []
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    private var topHelperView: some View = HStack {
        Text("최근 검색")
            .foregroundStyle(.black)
            .bold()
        Spacer()
        Button("모두 지우기") {
            print("clean")
        }.foregroundStyle(.green)
        .bold()
    }.padding(.horizontal, 10)
    

    var body: some View {
        NavigationStack {
            VStack {
                topHelperView
                    
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(Array(recentSearch.enumerated()), id: \.offset) { index, searchText in
                        recentSearchViews(text: searchText.searchText, index: index)
                    }
                })
                
            }.navigationTitle("떠나고싶은 고래밥님의 새싹쇼핑").navigationBarTitleDisplayMode(.inline)
            Spacer()
            
        }
        .searchable(text: $str, placement: .navigationBarDrawer(displayMode: .always),prompt: "브랜드, 상품, 프로필, 태그 등")
        .onSubmit(of: .search) {
            recentSearch.insert(SearchData(searchText: str), at: 0)
        }
    }
    
    private func recentSearchViews(text: String, index: Int) -> some View {
        
        let recentSearchView: some View = HStack {
            Image(systemName: "magnifyingglass")
            Text(text)
            Spacer()
            Button(action: {
                recentSearch.remove(at: index)
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.gray)
            })
        }.padding(.horizontal, 10)
        
        return recentSearchView
    }
    
}

struct aView: View {
    var body: some View {
        Text("dd")
    }
}

#Preview {
    SearchView()
}
