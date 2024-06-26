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
    var detailsView: DetailsScreenViewProtocol?
    private var interactor: CharacterInteractorInputProtocol
    private var router: RouterProtocol
    var charList: [CharacterMModel] = [CharacterMModel]()
    private var currentpage:Int = 0
     var numOfPages:Int = 0
    var isFilterEnabled = false
    var numOfRows: Int {
        return charList.count
    }
    
    init( view: CharacterViewProtocol?, interactor: CharacterInteractorInputProtocol, router: RouterProtocol) {
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
        if currentpage < numOfPages {
            interactor.getNextPage(page: currentpage + 1)
        }
    }
    
    func filterList(by status:Status?) {
        isFilterEnabled = status != nil
        interactor.filterCharacterList(status)
    }
    func presentFilteredList(filterdList: [CharacterMModel]) {
        self.charList = filterdList
        view?.displayFilteredList(filteredList: filterdList)
        view?.reloadData()
    }
    
    func openItemDetailsView(item: Int) {
        interactor.fetchItemDetails(item: item,isFiltering:isFilterEnabled)
    }
    
    func presentItemDetails(item: CharacterViewModel) {
        router.navigateToItemDetails(item: item)
        
//        detailsView?.displayItemDetails(item: item)
        
    }
    
   //MARK: - CHARACTERINTERACTOROUTPUTPROTOCOL
    func charListFetchedSuccessfully(charsList:[CharacterMModel], pages:Int) {
        numOfPages = pages
        if pages > currentpage {
            self.charList = charsList
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
