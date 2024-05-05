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
        let charItm = charList[indexPath.row - 1]
        let charVM = CharacterViewModel(with: charItm)
       return charVM
    }
    func ViewLoaded() {
        view?.showLoading()
        interactor.getCharacterList()
    }
    
   //MARK: - CHARACTERINTERACTOROUTPUTPROTOCOL
    func charListFetchedSuccessfully(charsList:[CharacterMModel]) {
        charList.append(contentsOf: charsList)
        view?.hideLoading()
        view?.reloadData()
    }
    
    func FailedToFetch(with err: any Error) {
        view?.hideLoading()
        // SHOW ERROR
    }
}
