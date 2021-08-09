//
//  TitleDetailViewController.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 30/07/21.
//

import UIKit

protocol TitleDetailPresenterOutput: AnyObject {
    func presenter(didRetrieveItem item: String)
    func presener(didFailRetrieveItem message: String)
}

class TitleDetailViewController: UIViewController {
    
    // MARK: - properties
    
    private let titleDetailView: TitleDetailView?
    private let interactor: TitleDetailInteractor?
    
    // MARK: - Init
    
    init(view: TitleDetailView, interactor: TitleDetailInteractor) {
        self.titleDetailView = view
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = titleDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension TitleDetailViewController: TitleDetailPresenterOutput {
    func presenter(didRetrieveItem item: String) {
        titleDetailView?.updateLabel(with: item)
    }
    
    func presener(didFailRetrieveItem message: String) {
        showError(with: message)
    }
}
