//
//  TitlesInteractor.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 28/07/21.
//

import Foundation

protocol TitlesInteractor: AnyObject {
    func getTitles()
    func addTaped(with text: String)
    
    func didCommitDelete(for index: Int)
    
    func didSelectRow(at index: Int)
}

protocol TitleDataStore {
    var title: TitleModel.Title? { get set }
}

class TitlesInteractorImplementation: TitlesInteractor, TitleDataStore {
    
    var title: TitleModel.Title?
    
    private let titleService: TitleService = TitleServiceImplementation()
    private var titles: [Title] = []
    private let presenter: TitlesPresenter
    private let worker: TitleWorker
    
    init(presenter: TitlesPresenter, worker: TitleWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func getTitles() {
        do {
            titles = try worker.getTitles()
            presenter.interactor(didRetrieveTitles: titles)
        } catch {
            presenter.interactor(didFailRetrieveTitles: error)
        }
        
    }
    
    func addTaped(with text: String) {
        do {
            let title = try worker.addTitle(text)
            titles.append(title)
            presenter.interactor(didAddTitle: title)
        } catch {
            presenter.interactor(didFailAddTitle: error)
        }
       
    }
    
    func didCommitDelete(for index: Int) {
        do {
            try worker.deleteTitle(with: titles[index].id!)
            titles.remove(at: index)
            presenter.interactor(didDeleteTitleAtIndex: index)
        } catch {
            presenter.interactor(didFailDeleteTitleAtIndex: index)
        }
        
    }
    
    func didSelectRow(at index: Int) {
        if self.titles.indices.contains(index) {
            title = TitleModel.Title(id: titles[index].id!, text: titles[index].text!)
            presenter.interactor()
        }
    }

}
