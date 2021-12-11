//
//  Pokemon.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/04.
//

import Foundation

// ポケモンのデータ
struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprites: Images
    let types: [Types]
}

struct Images: Codable {
    let frontImage: String // ポケモンの画像URL
    let shinyImage: String // 色違いポケモンの画像URL

    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
        case shinyImage = "front_shiny"
    }
}

struct Types: Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
}
