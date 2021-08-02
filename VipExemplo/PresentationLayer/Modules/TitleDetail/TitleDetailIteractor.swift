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
    
    private let titleService = TitleServiceImplementation()
    
    func viewDidLoad() {
        do {
            if let title = try titleService.getTitle(with: titleId!) {
                presenter?.interactor(didRetrieveTitle: title)
            }
        } catch {
            presenter?.interactor(didFailRetrieveTitle: error)
        }
       
    }
    
    
}
