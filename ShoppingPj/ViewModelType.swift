//
//  ViewModelType.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import Foundation
import Combine

protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    
    var input: Input { get }
    var output: Output { get }
    
    func transform()
}
