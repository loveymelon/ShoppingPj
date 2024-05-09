//
//  SearchResultViewModel.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import SwiftUI
import Combine

class SearchResultViewModel: ViewModelType, ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    let input = Input()
    let output = Output()
    
    init() {
        transform()
    }
    
}

extension SearchResultViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform() {
        <#code#>
    }
}
