//
//  ButtonViewModifier.swift
//  ShoppingPj
//
//  Created by 김진수 on 5/9/24.
//

import SwiftUI

extension View {
    func asPointButton(completionHandler: @escaping (() -> Void)) -> some View {
        modifier(ButtonViewModifier(action: completionHandler))
    }
}

struct ButtonViewModifier: ViewModifier {
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            content.foregroundStyle(.green)
                .bold()
        }
    }
}
