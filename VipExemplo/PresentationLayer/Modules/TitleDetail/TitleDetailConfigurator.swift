//
//  TitleDetailConfigurator.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 30/07/21.
//

import Foundation

class TitileDetailConfigurator {
    
    static func configureModule(title: TitleModel.Title) -> TitleDetailViewController {
        let presenter = TitleDetailPresenteImplematation()
        let interactor = TitleDetailInteractorImplemantation(presenter: presenter)
        interactor.title = title
        
        let view = TitleDetailView()
        let viewController = TitleDetailViewController(view: view, interactor: interactor)
        presenter.viewController = viewController
        
        return viewController
        
    }
}
