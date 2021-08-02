//
//  PersistentContainerProvider.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 02/08/21.
//

import CoreData

class PersistentContainerProvider {
    
    init() {}
    
    private static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let erro = error as NSError? {
                fatalError("Unresolved error \(String(describing: error)), \(erro.userInfo)")
            }
        }
        
        return container
    }()
    
    public static func getInstance() -> NSPersistentContainer {
        return persistentContainer
    }
}
