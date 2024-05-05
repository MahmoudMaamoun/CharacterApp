//
//  CharacterViewModel.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 05/05/2024.
//

import Foundation
class CharacterViewModel {
    @Published var name:String
    @Published var image:String
    @Published var type:String
    
    init(with charItem: CharacterMModel) {
        self.name = charItem.name
        self.image = charItem.image
        self.type = charItem.type
    }
}
