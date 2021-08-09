//
//  TitleDetailPresenter.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 01/08/21.
//

import Foundation

protocol TitleDetailPresenter: AnyObject {
    func interactor(didRetrieveTitle title: TitleModel.Title)
    func interactor(didFailRetrieveTitle error: String)
}

class TitleDetailPresenteImplematation: TitleDetailPresenter {
    
    weak var viewController: TitleDetailViewController?
    
    func interactor(didRetrieveTitle title: TitleModel.Title) {
        let titleString = title.text
        viewController?.presenter(didRetrieveItem: titleString)
    }
    
    func interactor(didFailRetrieveTitle error: String) {
        viewController?.presener(didFailRetrieveItem: error)
    }
    
    
}
