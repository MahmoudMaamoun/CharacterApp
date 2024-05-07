//
//  CharacterObservableObject.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 05/05/2024.
//

import Foundation

class CharacterObservableObject : ObservableObject {
    
    private var presenter:CharacterPresenterProtocol!
    private var indexPath:IndexPath!
    @Published var viewModel:CharacterViewModel
   
    init(presenter: CharacterPresenterProtocol!, indexPath: IndexPath!) {
        self.presenter = presenter
        self.indexPath = indexPath
        
        self.viewModel = presenter.configureCell(indexPath: indexPath)
    }
}
