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
    let favorTextEntries: [FlavorTextEntries]
    let sprites: Sprites

    private enum CodingKeys: String, CodingKey {
        case names = "names"
        case favorTextEntries = "flavor_text_entries"
        case sprites = "sprites"
    }

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
        let versionGroup: VersionGroup

        private enum CodingKeys: String, CodingKey {
            case language = "language"
            case text = "text"
            case versionGroup = "version_group"
        }

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

