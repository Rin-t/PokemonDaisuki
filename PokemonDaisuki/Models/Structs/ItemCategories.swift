//
//  ItemCategories.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/05.
//

import Foundation

var itemCategoriesURL = "https://pokeapi.co/api/v2/item-category/1/"

// アイテムのカテゴリとカテゴリ別の一覧を取得できるURL
struct ItemCategories: Codable {
    let id: Int
    let items: [Items]
    let name: String //カテゴリ名 英語のみ

    struct Items: Codable {
        let name: String
        let url: String //アイテムデータのURL
    }
}
