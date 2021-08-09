//
//  TitleDetailConfigurator.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 30/07/21.
//

import Foundation

class TitileDetailConfigurator {
    
    static func configureModule(titleId: String, viewController: TitleDetailViewController) {
        
        let presenter = TitleDetailPresenteImplematation()
        let view = TitleDetailView()
        let interactor = TitleDetailInteractorImplemantation()
        
        
        interactor.titleId = titleId
        
        viewController.titleDetailView = view
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
    }
}
