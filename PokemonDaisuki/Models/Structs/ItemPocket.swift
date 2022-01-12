//
//  ItemCategories.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/05.
//

import Foundation

// アイテムのカテゴリとカテゴリ別の一覧を取得できるURL
struct ItemPocket: Codable {
    let name: String 
    let categories: [Category]

    struct Category: Codable {
        let name: String
        let url: String //アイテムデータのURL
    }
}
