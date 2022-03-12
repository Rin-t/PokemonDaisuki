//
//  ItemCategories.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/05.
//

import Foundation

// アイテムのカテゴリとカテゴリ別の一覧を取得できるURL
struct Ball: Decodable {
    let name: String 
    let sprites: BallImage
    let effectEntries: [EffectEntries]

    private enum CodingKeis: String, CodingKey {
        case name
        case sprites
        case effectEntries = "effect_entries"
    }

    init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: CodingKeis.self)
        name = try root.decode(String.self, forKey: .name)
        sprites = try root.decode(BallImage.self, forKey: .sprites)
        effectEntries = try root.decode([EffectEntries].self, forKey: .effectEntries)
    }
}

struct BallImage: Decodable {
    let `default`: String
}

struct EffectEntries: Decodable {
    let effect: String
}
