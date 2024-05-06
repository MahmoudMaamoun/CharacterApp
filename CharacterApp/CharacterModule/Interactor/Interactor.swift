//
//  Interactor.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation
class Interactor : CharacterInteractorInputProtocol {
    
    //MARK: - PROPERTIES
    var presenter:CharList_Presenter?
    let services:CharacterServices = CharacterServices()
    
    //MARK: - FUNCTION
    
    func getCharacterList() {
        services.getChars { chars, err in
           
            if let charList = chars {
                self.presenter?.charListFetchedSuccessfully(charsList: charList.results, pages: charList.info.pages)
            } else if let _ = err {
                self.presenter?.FailedToFetch(with: err!)
            }
        }
    }
    
    func getNextPage(page:Int) {
        services.getChars(page) { chars, err in
           
            if let charList = chars {
                self.presenter?.charListFetchedSuccessfully(charsList: charList.results, pages: charList.info.pages)
            } else if let _ = err {
                self.presenter?.FailedToFetch(with: err!)
            }
        }
    }
    
    func filterCharacterList() {
        
    }
    
    
}
