//
//  ItemCategories.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/05.
//

import Foundation

// アイテムのカテゴリとカテゴリ別の一覧を取得できるURL
struct Ball: Codable {
    let name: String 
    let sprites: BallImage
}

struct BallImage: Codable {
    let `default`: String
}
