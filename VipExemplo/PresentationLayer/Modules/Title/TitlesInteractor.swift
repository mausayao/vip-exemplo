//
//  TitlesInteractor.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 28/07/21.
//

import Foundation

protocol TitlesInteractor: AnyObject {
    func viewDidLoad()
    func addTaped(with text: String)
    
    func didCommitDelete(for index: Int)
    
    func didSelectRow(at index: Int)
}

class TitlesInteractorImplementation: TitlesInteractor {
    
    var presenter: TitlesPresenter?
    
    private let titleService: TitleService = TitleService()
    private var titles: [Title] = []
    
    func viewDidLoad() {
        titles = titleService.getTitle()
        presenter?.interactor(didRetrieveTitles: titles)
    }
    
    func addTaped(with text: String) {
        let title = titleService.addTitle(text: text)
        self.titles.append(title)
        presenter?.interactor(didAddTitle: title)
    }
    
    func didCommitDelete(for index: Int) {
        titleService.deleteTitle(with: titles[index].id)
        self.titles.remove(at: index)
        presenter?.interactor(didDeleteTitleAtIndex: index)
    }
    
    func didSelectRow(at index: Int) {
        if self.titles.indices.contains(index) {
            presenter?.interactor(didFindTitle: self.titles[index])
        }
    }
    
    
}
