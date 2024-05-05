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
    func configureCell(indexPath:IndexPath) -> CharacterViewModel
}

//MARK: - CHARACTER MODULE VIEW PROTOCOL
protocol CharacterViewProtocol {
    var presenter:CharacterPresenterProtocol! {get set}
    func showLoading()
    func hideLoading()
    func reloadData()
}

//MARK: - CHARACTER MODULE INTERACTOR INPUT PROTOCOL
protocol CharacterInteractorInputProtocol {
    func getCharacterList()
    func filterCharacterList()
    
}

//MARK: - CHARACTER MODULE INTERACTOR OUTPUT PROTOCOL
protocol CharacterInteractorOutputProtocol {
    func charListFetchedSuccessfully(charsList:[CharacterMModel])
    func FailedToFetch(with err:Error)
}
//MARK: - CHARACTER MODULE ROUTER PROTOCOL
protocol RouterProtocol {
    
}
