//
//  TitlesPresenter.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 29/07/21.
//

import Foundation

protocol TitlesPresenter: AnyObject {
    func interactor(didRetrieveTitles titles: [Title])
    func interactor(didFailRetrieveTitles error: Error)
    
    func interactor(didAddTitle title: Title)
    func interactor(didFailAddTitle error: Error)
    
    func interactor(didDeleteTitleAtIndex index: Int)
    func interactor(didFailDeleteTitleAtIndex index: Int)
    
    func interactor(didFindTitle title: Title)
}

class TitlesPresenterImplementation: TitlesPresenter {
    
    weak var viewController: TitlesPresenterOutput?
    
    func interactor(didRetrieveTitles titles: [Title]) {
        let titleStrings = titles.compactMap { $0.text }
        viewController?.presenter(didRetrieveItems: titleStrings)
    }
    
    func interactor(didFailRetrieveTitles error: Error) {
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
    
    func interactor(didAddTitle title: Title) {
        if let titleString = title.text {
            viewController?.presenter(didAddItem: titleString)
        }
        
    }
    
    func interactor(didFailAddTitle error: Error) {
        viewController?.presenter(didFailAddItem: error.localizedDescription)
    }
    
    func interactor(didDeleteTitleAtIndex index: Int) {
        viewController?.presenter(didDeleteItemAtIndex: index)
    }
    
    func interactor(didFailDeleteTitleAtIndex index: Int) {
        viewController?.presenter(didFailDeleteItemAtIndex: index, message: "Couldn't delete")
    }
    
    func interactor(didFindTitle title: Title) {
        if let id = title.id {
            viewController?.presenter(didObtainItemId: id)
        }
        
    }
    
}
