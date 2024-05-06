//
//  CharList_Presenter.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation
class CharList_Presenter : CharacterPresenterProtocol , CharacterInteractorOutputProtocol {
   
    
    //MARK: - PROPERTIES
    var view: CharacterViewProtocol?
    private var interactor: CharacterInteractorInputProtocol
    private var router: RouterProtocol
    private var charList: [CharacterMModel] = [CharacterMModel]()
    private var currentpage:Int = 0
    private var numOfPagee:Int = 0
    
    var numOfRows: Int {
        return charList.count
    }
    
    init(view: CharacterViewProtocol?, interactor: CharacterInteractorInputProtocol, router: RouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    //MARK: - PRESENTER PROTOCOL
    func configureCell(indexPath: IndexPath) -> CharacterViewModel {
        let charItm = charList[indexPath.row]
        let charVM = CharacterViewModel(with: charItm)
       return charVM
    }
    func ViewLoaded() {
        view?.showLoading()
        interactor.getCharacterList()
    }
    func loadNextPage() {
        if currentpage < numOfPagee {
            interactor.getNextPage(page: currentpage + 1)
        }
    }
    
   //MARK: - CHARACTERINTERACTOROUTPUTPROTOCOL
    func charListFetchedSuccessfully(charsList:[CharacterMModel], pages:Int) {
        numOfPagee = pages
        if pages > currentpage {
            charList.append(contentsOf: charsList)
            currentpage += 1
        }
        view?.hideLoading()
        view?.reloadData()
    }
    
    func FailedToFetch(with err: any Error) {
        view?.hideLoading()
        // SHOW ERROR
    }
}
