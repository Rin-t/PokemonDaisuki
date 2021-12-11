//
//  Region.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/04.
//

import Foundation

// 地域毎のデータ　プロパティの末尾にコメントがあるものを使用すると想定
struct Region: Codable {
    let id: Int
    let names: [Names]
    let pokedexes: [Pokedexes]

    struct Names: Codable {
        let language: Language
        let name: String //カントー地方などの地名

        struct Language: Codable {
            let name: String   //"ja-Hrkt"
            let url: String
        }
    }

    struct Pokedexes: Codable {
        let name: String
        let url: String  //地域毎のポケモンデータを所得できるURL
    }
}
