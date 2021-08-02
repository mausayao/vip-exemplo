//
//  TitleService.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 01/08/21.
//

import Foundation

final class TitleService {
    
    func getTitle() -> [Title] {
        return Title.titles
    }
    
    func addTitle(text: String) -> Title {
        let title = Title(text: text)
        Title.titles.append(title)
        return title
    }
    
    func deleteTitle(with id: String) {
        let index = Title.titles.firstIndex { $0.id == id }
        Title.titles.remove(at: index!)
    }
    
    func getTitle(with id: String) -> Title? {
        let index = Title.titles.firstIndex { $0.id == id }
        guard let idx = index else { return nil }
        
        return Title.titles[idx]
    }
}
