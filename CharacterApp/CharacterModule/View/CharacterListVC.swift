//
//  ViewController.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import UIKit
import SwiftUI
class CharacterListVC: UIViewController,CharacterViewProtocol {
   
    // MARK:- PROPERTIES
    var presenter:CharacterPresenterProtocol!
    var viewActivityInd: UIActivityIndicatorView!
    
    var tbView: UITableView!
   
    // For Testing Purpose
    var didNavigateToItemDetails:Bool = false
    //MARK:- FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        self.title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.accessibilityIdentifier = "CharactersNavigationBar"

        tbView = UITableView(frame: view.bounds, style: .plain)
        tbView.delegate = self
        tbView.dataSource = self
        tbView.accessibilityIdentifier = "charsList"
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.characterCellID)
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.filterCharListID)
        tbView.separatorStyle = .none
        view.addSubview(tbView)
        
        tbView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            tbView.topAnchor.constraint(equalTo: view.topAnchor),
            tbView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tbView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tbView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        presenter.ViewLoaded()
    }
    
    //MARK: - CHARACTER MODULE VIEW DELEGATE

    func showLoading() {
        DispatchQueue.main.async {
            self.viewActivityInd = UIActivityIndicatorView(style: .large)
            self.view.addSubview(self.viewActivityInd)
            self.viewActivityInd.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.viewActivityInd?.removeFromSuperview()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tbView?.reloadData()
        }
    }
    func displayFilteredList(filteredList: [CharacterMModel]) {
        reloadData()
    }
    func displayItemDetails(item: CharacterViewModel) {
        
    }
    
}


extension CharacterListVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return presenter.numOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let filterCell = tableView.dequeueReusableCell(withIdentifier: Constants.filterCharListID) else {
                fatalError("fatal error: you forgot to register filter tableviewcell")
            }
            filterCell.contentConfiguration = UIHostingConfiguration(content: {
                FilterCharactersView(presenter: presenter)
            })
//            filterCell.selectionStyle = .none
            return filterCell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:Constants.characterCellID)  else {
            fatalError("fatal error: you forgot to register table view cell")
        }

        cell.contentConfiguration = UIHostingConfiguration(content: {  CharacterListItemView(charItem: CharacterObservableObject(presenter: presenter,indexPath: indexPath))
        })
        cell.selectionStyle = .none
        // Now the Cell Data is Loaded through a presenter Layer Seperated From view,view Controllers
        return cell
    }
    
    
}

extension CharacterListVC : UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return 136
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // check if last cell so trigger pagination event and presenter start load next page
        if  presenter.numOfRows == (indexPath.row + 1) {
            presenter.loadNextPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.openItemDetailsView(item: indexPath.row)
    }
}
