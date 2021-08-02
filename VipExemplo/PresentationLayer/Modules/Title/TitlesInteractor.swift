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
    
    private let titleService: TitleService = TitleServiceImplementation()
    private var titles: [Title] = []
    
    func viewDidLoad() {
        do {
            titles = try titleService.getTitle()
            presenter?.interactor(didRetrieveTitles: titles)
        } catch {
            presenter?.interactor(didFailRetrieveTitles: error)
        }
        
    }
    
    func addTaped(with text: String) {
        do {
            let title = try titleService.addTitle(text: text)
            self.titles.append(title)
            presenter?.interactor(didAddTitle: title)
        } catch {
            presenter?.interactor(didFailAddTitle: error)
        }
       
    }
    
    func didCommitDelete(for index: Int) {
        do {
            try titleService.deleteTitle(with: titles[index].id!)
            self.titles.remove(at: index)
            presenter?.interactor(didDeleteTitleAtIndex: index)
        } catch {
            presenter?.interactor(didFailDeleteTitleAtIndex: index)
        }
        
    }
    
    func didSelectRow(at index: Int) {
        if self.titles.indices.contains(index) {
            presenter?.interactor(didFindTitle: self.titles[index])
        }
    }
    
    
}
