//
//  TitleDetailConfigurator.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 30/07/21.
//

import Foundation

class TitileDetailConfigurator {
    
    static func configureModule(titleId: String, viewController: TitleDetailViewController) {
        
        let view = TitleDetailView()
        let interactor = TitleDetailInteractorImplemantation()
        let presenter = TitleDetailPresenteImplematation()
        
        interactor.titleId = titleId
        
        viewController.titleDetailView = view
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
    }
}
