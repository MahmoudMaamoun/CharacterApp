//
//  CharacterViewModel.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 05/05/2024.
//

import Foundation
struct CharacterViewModel {
    var name:String
    var image:String
    var type:String
    
    init(with charItem: CharacterMModel) {
        self.name = charItem.name
        self.image = charItem.image
        self.type = charItem.type
    }
}
