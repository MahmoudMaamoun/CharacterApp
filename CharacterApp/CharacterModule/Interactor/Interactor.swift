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
    private var originalCharList: [CharacterMModel] = [CharacterMModel]()
    private var filteredCharList: [CharacterMModel] = [CharacterMModel]()

    //MARK: - FUNCTION
    
    func getCharacterList() {
        services.getChars { chars, err in
           
            if let charList = chars {
                self.originalCharList = charList.results
                self.presenter?.charListFetchedSuccessfully(charsList: self.originalCharList, pages: charList.info.pages)
            } else if let _ = err {
                self.presenter?.FailedToFetch(with: err!)
            }
        }
    }
    
    // Handle Paginnation Logic
    func getNextPage(page:Int) {
        services.getChars(page) { chars, err in

            if let charList = chars {
                self.originalCharList.append(contentsOf: charList.results)
                self.presenter?.charListFetchedSuccessfully(charsList: self.originalCharList, pages: charList.info.pages)
            } else if let _ = err {
                self.presenter?.FailedToFetch(with: err!)
            }
        }
    }
    //Handle Filter Logic
    func filterCharacterList(_ status: Status?) {
        
        guard let status = status else {
            presenter?.presentFilteredList(filterdList: originalCharList)
            return
        }
        
        let filteredList = self.originalCharList.filter { characterItem in
           
            switch status {
            case .alive:
                characterItem.status == "Alive"
            case .dead:
                characterItem.status == "Dead"
            case .unknown:
                characterItem.status == "unknown"
            }
        }
        
        self.filteredCharList = filteredList
        print("filter by \(status) in \(originalCharList.count) Item . Result: \(filteredList.count) Item founded")
        presenter?.presentFilteredList(filterdList:filteredList)
    }
    
    func fetchItemDetails(item: Int,isFiltering: Bool) {
        
        var itmDetails = self.originalCharList[item]
        if isFiltering {
            itmDetails = filteredCharList[item]
        }
        presenter?.presentItemDetails(item: CharacterViewModel(with: itmDetails))
    }
    
    
    
}
