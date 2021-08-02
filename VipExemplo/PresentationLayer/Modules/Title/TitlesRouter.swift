//
//  TitlesRouter.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 29/07/21.
//

import UIKit

protocol TitlesRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with id: String)
}

class TitlesRouterImplementation: TitlesRouter {
    weak var navigationController: UINavigationController?
    
    func routeToDetail(with id: String) {
        let viewController = TitleDetailViewController()
        TitileDetailConfigurator.configureModule(titleId: id, viewController: viewController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
