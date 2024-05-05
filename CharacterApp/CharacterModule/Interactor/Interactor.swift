//
//  Interactor.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation
class Interactor : CharacterInteractorInputProtocol {
    
    var presenter:CharList_Presenter?
    let services:CharacterServices = CharacterServices()
    
    func getCharacterList() {
        services.getChars { chars, err in
           
            if let charList = chars {
                self.presenter?.charListFetchedSuccessfully(charsList: charList.results)
            } else if let _ = err {
                self.presenter?.FailedToFetch(with: err!)
            }
        }
    }
    
    func filterCharacterList() {
        
    }
    
    
}
