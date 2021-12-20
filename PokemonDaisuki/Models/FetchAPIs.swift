//
//  FetchAPIs.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/16.
//

import Foundation

final class FetchAPIs {

    private let itemCategoryIDRange = 1...46 // アイテムカテゴリは46個
    private let pokemonIDRange = 1...151 // クイズ用のポケモンデータ151の夢
    private let regionIDRange = 1...8 // 8地域

    // APIを叩く際の項目
    enum TypeOfFetch {
        case itemCategories
        case pokemon
        case region
    }

    // MARK: - それぞれの画面で呼び出すメソッド
        // ポケモン151匹のJSONデータを取得
        func decodePokemonData(typeOfFetch: TypeOfFetch) {

            fetchData(typeOfFetch: .pokemon) { dataArray in
                var jsons: [Pokemon] = []

                for data in dataArray {
                    do {
                        let json = try JSONDecoder().decode(Pokemon.self, from: data)
                        jsons.append(json)
                    } catch(let err) {
                        print(err)
                    }
                }
            }
        }

        // アイテムカテゴリーのJSONデータを取得
        func decodeItemCategoriesData(typeOfFetch: TypeOfFetch) {

            fetchData(typeOfFetch: .itemCategories) { dataArray in
                var jsons: [ItemCategories] = []

                for data in dataArray {
                    do {
                        let json = try JSONDecoder().decode(ItemCategories.self, from: data)
                        jsons.append(json)
                    } catch(let err) {
                        print(err)
                    }
                }
            }
        }

        // 地域ごとのJSONデータを取得
        func decodeRegionData(typeOfFetch: TypeOfFetch) {

            fetchData(typeOfFetch: .region) { dataArray in
                var jsons: [Region] = []

                for data in dataArray {
                    do {
                        let json = try JSONDecoder().decode(Region.self, from: data)
                        jsons.append(json)
                    } catch(let err) {
                        print(err)
                    }
                }
            }
        }


    // MARK: - 上記のそれぞれの画面で呼び出すメソッドの中で使用するメソッド群
    // APIのURL群を使用してDataの配列を受け取る
    func fetchData(typeOfFetch: TypeOfFetch, completion: @escaping ([Data]) -> Void) {

        let idRange = switchRangeFromTypeOfFetch(typeOfFetch: typeOfFetch)
        let stringURLs = switchURLsFromTypeOfFetch(typeOfFetch: typeOfFetch, range: idRange)
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

    // fetchData()内のidRangeを求めるのに使用する 　配列を出力
    func switchRangeFromTypeOfFetch(typeOfFetch: TypeOfFetch) -> ClosedRange<Int> {

        let range: ClosedRange<Int>

        switch typeOfFetch {
        case .itemCategories: range = itemCategoryIDRange
        case .pokemon: range = pokemonIDRange
        case .region: range = regionIDRange
        }

        return range
    }

    // fetchData()内のstringURLsを求めるのに使用する  URLの配列を出力　一番初めにAPIで取得するURL群
    func switchURLsFromTypeOfFetch(typeOfFetch: TypeOfFetch, range: ClosedRange<Int>) -> [String] {

        let urls: [String] = range.map { id in

            let url: String
            switch typeOfFetch {
            case .itemCategories: url = "https://pokeapi.co/api/v2/item-category/\(id)/"
            case .pokemon: url = "https://pokeapi.co/api/v2/pokemon/\(id)/"
            case .region: url = "https://pokeapi.co/api/v2/region/\(id)/"
            }
            return url
        }
        return urls
    }
}
