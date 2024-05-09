//
//  SearchViewModel.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import Foundation
import Combine

class SearchViewModel: ViewModelType, ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    var input = Input()
    
    @Published
    var output = Output()
    
    init() {
        transform()
    }
    
}

extension SearchViewModel {
    struct Input {
        let searchText = PassthroughSubject<String, Never>()
        let deleteRecent = PassthroughSubject<Int, Never>()
        let deleteAll = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var outputRecentSearch: [SearchData] = []
    }
    
    func transform() {
        input.searchText.sink { [weak self] searchText in
            guard let self else { return }
            
            output.outputRecentSearch.insert(SearchData(searchText: searchText), at: 0)
            
        }.store(in: &cancellables)
        
        input.deleteRecent.sink { [weak self] index in
            guard let self else { return }
            
            output.outputRecentSearch.remove(at: index)
            
        }.store(in: &cancellables)
        
        input.deleteAll.sink { [weak self] _ in
            guard let self else { return }
            
            output.outputRecentSearch.removeAll()
            
        }.store(in: &cancellables)
    }
}
