//
//  TitlesRouter.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 29/07/21.
//

import UIKit

protocol TitlesRouter: AnyObject {
    
    func routeToDetail()
}

protocol TitleDataPassing {
    var dataStore: TitleDataStore { get }
}

class TitlesRouterImplementation: TitlesRouter, TitleDataPassing {
    var dataStore: TitleDataStore
    
    weak var viewControlle: TitlesViewController?
    
    init(dataStore: TitleDataStore) {
        self.dataStore = dataStore
    }
    
    func routeToDetail() {
        guard let title = dataStore.title else { return }
        
        let destination = TitileDetailConfigurator.configureModule(title: title)
        viewControlle?.present(destination, animated: true, completion: nil)
    }
    
}
