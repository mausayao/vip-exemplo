//
//  TitleConfigurator.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 28/07/21.
//

import UIKit

class TitlesConfigurator {
    static func configureModule() -> TitlesViewController {
        let presenter = TitlesPresenterImplementation()
        let worker = TitleWorkImplementation(service: TitleServiceImplementation())
        let interactor = TitlesInteractorImplementation(presenter: presenter, worker: worker)
        
        let view = TitlesView()
        let router = TitlesRouterImplementation(dataStore: interactor)
       
        let viewController = TitlesViewController(titlesView: view, interactor: interactor, router: router)
        
        router.viewControlle = viewController
        presenter.viewController = viewController
        
        return viewController
    }
}
