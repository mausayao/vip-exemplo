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
    var navigationController: UINavigationController?
    
    func routeToDetail(with id: String) {
        
    }
}
