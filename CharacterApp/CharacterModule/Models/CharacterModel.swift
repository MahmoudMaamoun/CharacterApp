//
//  CharacterModel.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation

struct ResultModel : Codable {
    let info: Info
    let results:[CharacterMModel]
}
//MARK: - INFO MODEL
struct Info : Codable {
    let count, pages: Int
      let next: String
      let prev:String?
}
//MARK: - CHARACTER MODEL
struct CharacterMModel : Codable
{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
//MARK: - STATUS
enum Status {
    case alive
    case dead
    case unknown
}
