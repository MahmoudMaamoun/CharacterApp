//
//  Protocols.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation

//MARK: - CHARACTER MODULE PRESENTER PROTOCOL
protocol CharacterPresenterProtocol {
    var view:CharacterViewProtocol? {get set}
    var numOfRows:Int {get}
    func ViewLoaded()
    func loadNextPage()
    func configureCell(indexPath:IndexPath) -> CharacterViewModel
    func filterList(by status:Status?) // presenter Input
    func presentFilteredList(filterdList:[CharacterMModel]) // present filtered list
}

//MARK: - CHARACTER MODULE VIEW PROTOCOL
protocol CharacterViewProtocol {
    var presenter:CharacterPresenterProtocol! {get set}
    func showLoading()
    func hideLoading()
    func reloadData()
    func displayFilteredList(filteredList:[CharacterMModel])
}

//MARK: - CHARACTER MODULE INTERACTOR INPUT PROTOCOL
protocol CharacterInteractorInputProtocol {
    func getCharacterList()
    func getNextPage(page:Int)
    func filterCharacterList(_ status:Status?) // filter logic
    
}

//MARK: - CHARACTER MODULE INTERACTOR OUTPUT PROTOCOL
protocol CharacterInteractorOutputProtocol {
    func charListFetchedSuccessfully(charsList:[CharacterMModel], pages:Int)
    func FailedToFetch(with err:Error)
}
//MARK: - CHARACTER MODULE ROUTER PROTOCOL
protocol RouterProtocol {
    
}
