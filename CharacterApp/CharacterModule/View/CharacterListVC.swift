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
   
    //MARK:- FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuptbView()
    }
    
    func setuptbView() {
        self.title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tbView = UITableView(frame: view.bounds, style: .plain)
        tbView.delegate = self
        tbView.dataSource = self
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.characterCellID)
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.filterCharListID)
        
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
            self.viewActivityInd.removeFromSuperview()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tbView.reloadData()
        }
    }
    
}


extension CharacterListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numOfRows + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let filterCell = tableView.dequeueReusableCell(withIdentifier: Constants.filterCharListID) else {
                fatalError("fatal error: you forgot to register filter tableviewcell")
            }
            
            filterCell.contentConfiguration = UIHostingConfiguration(content: {
                FilterCharactersView()
            })
            filterCell.selectionStyle = .none
                    return filterCell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier:Constants.characterCellID)  else {
            fatalError("fatal error: you forgot to register table view cell")
        }
       
        // return swiftui + assign data
        cell.contentConfiguration = UIHostingConfiguration(content: {

            CharacterListItemView(presenter: presenter,indexPath: indexPath)
        })
       
        // Now the Cell Data is Loaded through a presenter Layer Seperated From view,view Controllers
        return cell
    }
    
    
}

extension CharacterListVC : UITableViewDelegate {
    
}
