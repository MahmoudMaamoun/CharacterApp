//
//  CharacterServices.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation

class CharacterServices {
    
    //MARK: - PROPERTIES
    let networkLayer = NetworkLayer()
    
    //MARK: - FUNCTIONS
    func getChars(completionHandler:@escaping(ResultModel? , Error?)-> ()) {
        networkLayer.get(url: URL(string: Constants.CharsListURL)!, responseType: ResultModel.self) { result in
            switch result {
            case .success(let charsItems):
                print("Chars Fetched successfully")
                completionHandler(charsItems,nil)
            case .failure(let error):
                print("error : \(error)")
                completionHandler(nil,error)
            }
        }
    }
}
