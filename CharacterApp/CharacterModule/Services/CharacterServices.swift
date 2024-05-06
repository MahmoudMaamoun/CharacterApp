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
    func getChars(_ page:Int = 0,completionHandler:@escaping(ResultModel? , Error?)-> ()) {
        let url = page > 0 ? "\(Constants.CharsListURL)?page=\(page)": Constants.CharsListURL
        
        networkLayer.get(url: URL(string:url)!, responseType: ResultModel.self) { result in
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
