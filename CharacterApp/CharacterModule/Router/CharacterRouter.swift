//
//  CharacterRouter.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import UIKit
class CharacterRouter : RouterProtocol {
    //MARK: - PROPERTIES
    var viewController:CharacterListVC?
    
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
}
