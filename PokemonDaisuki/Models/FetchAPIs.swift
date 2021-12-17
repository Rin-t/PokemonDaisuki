//
//  FetchAPIs.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/16.
//

import Foundation

final class FetchAPIs {

    let itemCategoryIDRange = 1...46 // アイテムカテゴリは46個
    let pokemonIDRange = 1...151 // 151の夢
    let regionIDRange = 1...8 // 8地域

    // APIを叩く際の項目
    enum TypeOfFetch {
        case item
        case pokemon
        case region
    }

    // TypeOfFetchからRange型を出力 switchURLsFrom~で使用する
    func switchRangeFromTypeOfFetch(typeOfFetch: TypeOfFetch) -> ClosedRange<Int> {

        let range: ClosedRange<Int>

        switch typeOfFetch {
        case .item: range = itemCategoryIDRange
        case .pokemon: range = pokemonIDRange
        case .region: range = regionIDRange
        }

        return range
    }

    // TypeOfFetchとRangeからURLの配列を出力　一番初めにAPIで取得するURL群
    func switchURLsFromTypeOfFetch(typeOfFetch: TypeOfFetch, range: ClosedRange<Int>) -> [String] {

        let urls: [String] = range.map { id in

            let url: String
            switch typeOfFetch {
            case .item: url = "https://pokeapi.co/api/v2/item-category/\(id)/"
            case .pokemon: url = "https://pokeapi.co/api/v2/pokemon/\(id)/"
            case .region: url = "https://pokeapi.co/api/v2/region/\(id)/"
            }
            return url
        }
        return urls
    }

    // Dataの配列を受け取る Dataの配列からDataを一つずつ取り出してJSONDecodeする
    func fetchData(typeOfFetch: TypeOfFetch, completion: @escaping ([Data]) -> Void) {

        let range = switchRangeFromTypeOfFetch(typeOfFetch: typeOfFetch)
        let stringURLs = switchURLsFromTypeOfFetch(typeOfFetch: typeOfFetch, range: range)
        var dataArray: [Data] = []

        // URLRequest型にstringURLsを変換
        let urls = stringURLs.map { stringURL in
            URL(string: stringURL)
        }

        // urlsからurlという名で一つずつdataを取り出してdataArrayに追加
        for url in urls {
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in

                if let error = error {
                    print(error)
                    return
                }

                if let data = data {
                    dataArray.append(data)
                }

                if dataArray.count == urls.count {
                    completion(dataArray)
                }
            }
            task.resume()
        }
    }
}
