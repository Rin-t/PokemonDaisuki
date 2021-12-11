//
//  Item.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/06.
//

import Foundation

// アイテムデータ
struct PokeItem: Codable {
    let names: [ItemNames]
    let flavor_text_entries: [FlavorTextEntries]
    let sprites: Sprites

    // MARK: - names
    struct ItemNames: Codable {
        let language: ItemLanguage
        let name: String //アイテム名

        struct ItemLanguage: Codable {
            let name: String //"ja-Hrkt"
            let url: String
        }
    }

    //MARK: - flavorTextEntries
    struct FlavorTextEntries: Codable {
        let language: FlavorLanguage
        let text: String   //アイテムの解説文
        let version_group: VersionGroup

        struct FlavorLanguage: Codable {
            let name: String //"ja-Hrkt"
            let url: String
        }

        struct VersionGroup: Codable {
            let name: String
            let url: String
        }
    }

    // MARK: - Sprites
    struct Sprites: Codable {
        let itemImageURL: String //画像URL

        enum CodingKeys: String, CodingKey {
            case itemImageURL = "default"
        }
    }
}
