//
//  TitlesViewController.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 28/07/21.
//

import UIKit

protocol TitlesPresenterOutput: AnyObject {
    func presenter(didRetrieveItems items: [String])
    func presenter(didFailRetrieveItems message: String)
    
    func presenter(didAddItem item: String)
    func presenter(didFailAddItem message: String)
    
    func presenter(didDeleteItemAtIndex index: Int)
    func presenter(didFailDeleteItemAtIndex index: Int, message: String)
    
    func presenter()
    func presenter(didFailObtainItemId message: String)
}

class TitlesViewController: UIViewController {
    
    // MARK: - properties
    
    private let titlesView: TitlesView
    private let interactor: TitlesInteractor
    private let router: TitlesRouter
    
    internal var items: [String] = []
    
    lazy var addBarButtonIten: UIBarButtonItem = {
        let item = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBarButtonItemTapped))
        return item
    }()
    
    init(titlesView: TitlesView, interactor: TitlesInteractor, router: TitlesRouter) {
        self.titlesView = titlesView
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = titlesView
        titlesView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getTitles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Titles"
        self.navigationItem.rightBarButtonItem = addBarButtonIten
    }
    
    // MARK: - actions
    
    @objc func addBarButtonItemTapped() {
        
        let alert = UIAlertController(
            title: "Add a new title",
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addTextField { textFiled in
            textFiled.placeholder = "Text"
        }
        
        let okAction = UIAlertAction(
            title: "Add",
            style: .default) { [weak self] action in
            self?.interactor.addTaped(with: alert.textFields?.first?.text ?? "")
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - presenter output

extension TitlesViewController: TitlesPresenterOutput {
    func presenter(didRetrieveItems items: [String]) {
        self.items = items
        self.titlesView.reloadTableView()
    }
    
    func presenter(didFailRetrieveItems message: String) {
        showError(with: message)
    }
    
    func presenter(didAddItem item: String) {
        self.items.append(item)
        self.titlesView.insertRowAt(at: self.items.count - 1)
    }
    
    func presenter(didFailAddItem message: String) {
        showError(with: message)
    }
    
    func presenter(didDeleteItemAtIndex index: Int) {
        self.items.remove(at: index)
        self.titlesView.deleteRow(at: index)
    }
    
    func presenter(didFailDeleteItemAtIndex index: Int, message: String) {
        showError(with: message)
    }
    
    func presenter() {
        self.router.routeToDetail()
    }
    
    func presenter(didFailObtainItemId message: String) {
        showError(with: message)
    }
}

// MARK: - UITableView DataSource & Delegate

extension TitlesViewController: TitleViewDelegate {
    func didCommitDelete(for index: Int) {
        self.interactor.didCommitDelete(for: index)
    }
    
    func didSelectRow(at index: Int) {
        self.interactor.didSelectRow(at: index)
    }
}
