//
//  CharacterRouter.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import UIKit
import SwiftUI
class CharacterRouter : RouterProtocol {
    
    
    //MARK: - PROPERTIES
    var viewController:CharacterListVC?
    
    //MMARK: - ROUTER FUNCTIONS
    static func createModule() -> UIViewController {
        
       let charListVC = CharacterListVC()
        
        let interactor = Interactor()
        let router = CharacterRouter()
        let presenter = CharList_Presenter(view:charListVC,interactor: interactor, router: router)
        
        charListVC.presenter = presenter
        interactor.presenter = presenter
        router.viewController = charListVC
        
        return charListVC
    }
    
    func navigateToItemDetails(item:CharacterViewModel) {
        let detailsVC = UIHostingController(rootView: CharacterDetailsView(item:item,backAction: {
            self.viewController?.navigationController?.popViewController(animated: true)
            self.viewController?.navigationController?.isNavigationBarHidden = false
        }))
        self.viewController?.navigationController?.isNavigationBarHidden = true
        self.viewController?.navigationController?.pushViewController(detailsVC, animated: true)
        
        self.viewController?.didNavigateToItemDetails = true
    }
}
