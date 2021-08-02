//
//  Title.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 29/07/21.
//

import Foundation

class Title {
    let id: String
    let text: String
    
    init(text: String) {
        self.id = UUID().uuidString
        self.text = text
    }
}

extension Title {
    static var titles: [Title] = []
}
