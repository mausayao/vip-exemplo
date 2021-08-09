//
//  TitleWorker.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 09/08/21.
//

import Foundation

protocol TitleWorker: AnyObject {
    func getTitles() throws -> [Title]
    func addTitle(_ text: String) throws -> Title
    func deleteTitle(with id: String) throws
}

class TitleWorkImplementation: TitleWorker {
    
    private let service: TitleService
    
    init(service: TitleService) {
        self.service = service
    }
    
    func getTitles() throws -> [Title] {
        try service.getTitles()
    }
    
    func addTitle(_ text: String) throws -> Title {
        try service.addTitle(text: text)
    }
    
    func deleteTitle(with id: String) throws {
        try service.deleteTitle(with: id)
    }
    
    
}
