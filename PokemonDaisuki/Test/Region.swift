//
//  Region.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/04.
//

import Foundation

struct Region: Codable {
    let id: Int
    let names: [Names]
    let sprites: Images
    let pokedexes: [Pokedexes]
}

struct Names: Codable {
    let language: Language
    let name: String
}

struct Language: Codable {
    let name: String
    let url: String
}

struct Pokedexes: Codable {
    let name: String
    let url: String
}
