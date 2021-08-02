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
    
    var titleDetailView: TitleDetailView?
    var interactor: TitleDetailInteractor?
    weak var presenter: TitleDetailPresenter?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = titleDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func showError(with message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
