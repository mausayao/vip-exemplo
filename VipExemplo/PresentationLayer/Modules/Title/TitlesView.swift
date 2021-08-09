//
//  TitlesView.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 28/07/21.
//

import UIKit

protocol TitleViewDelegate: AnyObject {
    var items: [String] {set get}
    func didCommitDelete(for index: Int)
    func didSelectRow(at index: Int)
}

class TitlesView: UIView {
    
    //MARK: - properties
    lazy var tableVIew: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70.0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var placeHolderLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.font = UIFont(name: "Avenir-Heavy", size: 25)
        uiLabel.text = "No items yet, add one"
        uiLabel.textColor = .darkGray
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }()
    
    weak var delegate: TitleViewDelegate?
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - actions
    func showPlaceHolder() {
        UIView.animate(withDuration: 0.3) {
            self.placeHolderLabel.alpha = 1.0
            self.tableVIew.alpha = 0.0
        }
    }
    
    func hidePlaceHolder() {
        UIView.animate(withDuration: 0.3) {
            self.placeHolderLabel.alpha = 0.0
            self.tableVIew.alpha = 1.0
        }
    }
    
    func insertRowAt(at index: Int, section: Int = 0) {
        self.tableVIew.beginUpdates()
        self.tableVIew.insertRows(at: [
            IndexPath(
                row: index,
                section: section
                )
        ], with: .automatic)
        self.tableVIew.endUpdates()
    }
    
    func deleteRow(at index: Int, section: Int = 0) {
        self.tableVIew.beginUpdates()
        self.tableVIew.deleteRows(at: [
            IndexPath(
                row: index,
                section: section)
        ], with: .automatic)
        self.tableVIew.endUpdates()
    }
    
    func reloadTableView() {
        self.tableVIew.reloadData()
    }
    
}

extension TitlesView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items =  self.delegate?.items else { return 0}
        items.isEmpty ? showPlaceHolder() : hidePlaceHolder()
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = self.delegate?.items[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.delegate?.didCommitDelete(for: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRow(at: indexPath.row)
    }
    
    
}

extension TitlesView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.backgroundColor = .white
        
        self.addSubview(tableVIew)
        self.addSubview(placeHolderLabel)
        
        NSLayoutConstraint.activate([
            tableVIew.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableVIew.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableVIew.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableVIew.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            placeHolderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            placeHolderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
