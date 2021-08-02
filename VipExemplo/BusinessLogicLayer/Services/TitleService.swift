//
//  TitleService.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 01/08/21.
//

import CoreData

protocol TitleService: AnyObject {
    func getTitle() throws -> [Title]
    func addTitle(text: String) throws -> Title
    func deleteTitle(with id: String) throws
    func getTitle(with id: String) throws -> Title?
}

class TitleServiceImplementation: TitleService {
    let persistentContainer = PersistentContainerProvider.getInstance()
    lazy var managedContext: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func getTitle() throws -> [Title] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let titles = result as? [Title] {
                return titles
            } else {
                return []
            }
        } catch {
            return []
        }
    }
    
    func addTitle(text: String) throws -> Title {
        let title = NSEntityDescription.insertNewObject(forEntityName: "Title", into: managedContext) as! Title
        
        title.text = text
        title.id = UUID().uuidString
        
        do {
            try managedContext.save()
        }
        
        return title
    }
    
    func deleteTitle(with id: String) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let objectToDelete = result.first as? NSManagedObject {
                managedContext.delete(objectToDelete)
                
                do {
                    try managedContext.save()
                }
            }
        }
    }
    
    func getTitle(with id: String) throws -> Title? {
        let predicate = NSPredicate(format: "id = %@", id)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let title = result.first as? Title {
                return title
            }
        }
        
        return nil
    }
}
