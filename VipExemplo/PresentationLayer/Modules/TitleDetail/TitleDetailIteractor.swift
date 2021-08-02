//
//  TitleDetailIteractor.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 01/08/21.
//

import Foundation

protocol TitleDetailInteractor {
    var titleId: String? { get }
    func viewDidLoad()
}

class TitleDetailInteractorImplemantation: TitleDetailInteractor {
    var titleId: String?
    var presenter: TitleDetailPresenter?
    
    private let titleService = TitleService()
    
    func viewDidLoad() {
        if let title = titleService.getTitle(with: titleId!) {
            presenter?.interactor(didRetrieveTitle: title)
        } else {
            presenter?.interactor(didFailRetrieveTitle: "Not load view")
        }
    }
    
    
}
