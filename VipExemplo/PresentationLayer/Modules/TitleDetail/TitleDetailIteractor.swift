//
//  TitleDetailIteractor.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 01/08/21.
//

import Foundation

protocol TitleDetailInteractor {
    var title: TitleModel.Title? { get }
    func loadData()
}

class TitleDetailInteractorImplemantation: TitleDetailInteractor {
    var title: TitleModel.Title?
    private let presenter: TitleDetailPresenter
    
    init(presenter: TitleDetailPresenter) {
        self.presenter = presenter
    }
    
    func loadData() {
        if let title = title {
            presenter.interactor(didRetrieveTitle: title)
        } else {
            presenter.interactor(didFailRetrieveTitle: "Not load data")
        }
       
    }
    
    
}
