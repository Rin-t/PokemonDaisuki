//
//  FetchAPIs.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/16.
//

import Foundation

struct FetchAPIs {

    private static let itemCategoryIDRange = 1...8 // アイテムカテゴリは46個
    private static let pokemonIDRange = 1...151 // クイズ用のポケモンデータ151の夢
    private static let regionIDRange = 1...8 // 8地域

    // APIを叩く際の項目
    enum TypeOfFetch {
        case itemCategories
        case pokemon
        case region
    }

    // MARK: - それぞれの画面で呼び出すメソッド
    // ポケモン151匹のJSONデータを取得
   static func decodePokemonData(completion: @escaping ([Pokemon]) -> Void) {

         FetchAPIs.fetchData(typeOfFetch: .pokemon) { dataArray in
            var jsons: [Pokemon] = []

            for data in dataArray {
                do {
                    let json = try JSONDecoder().decode(Pokemon.self, from: data)
                    jsons.append(json)
                } catch(let err) {
                    print(err)
                }
            }
             completion(jsons)
        }
    }

    // アイテムカテゴリーのJSONデータを取得
   static func decodeItemCategoriesData(completion: @escaping ([ItemPocket]) -> Void) {

         FetchAPIs.fetchData(typeOfFetch: .itemCategories) { dataArray in
            var jsons: [ItemPocket] = []

            for data in dataArray {
                do {
                    let json = try JSONDecoder().decode(ItemPocket.self, from: data)
                    jsons.append(json)
                } catch(let err) {
                    print(err)
                }
            }
             completion(jsons)
        }
    }

    // 地域ごとのJSONデータを取得
   static func decodeRegionData(completion: @escaping ([Region]) -> Void) {

        FetchAPIs.fetchData(typeOfFetch: .region) { dataArray in
            var jsons: [Region] = []

            for data in dataArray {
                do {
                    let json = try JSONDecoder().decode(Region.self, from: data)
                    jsons.append(json)
                } catch(let err) {
                    print(err)
                }
            }
            jsons.sort(by: { $0.id < $1.id })
            completion(jsons)
        }
    }

    // MARK: - 上記のそれぞれの画面で呼び出すメソッドの中で使用するメソッド群
    // APIのURL群を使用してDataの配列を受け取る
    private static func fetchData(typeOfFetch: TypeOfFetch, completion: @escaping ([Data]) -> Void) {

        let idRange = switchRangeFromTypeOfFetch(typeOfFetch: typeOfFetch)
        let stringURLs = FetchAPIs.switchURLsFromTypeOfFetch(typeOfFetch: typeOfFetch, range: idRange)
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
    private static func switchRangeFromTypeOfFetch(typeOfFetch: TypeOfFetch) -> ClosedRange<Int> {

        let range: ClosedRange<Int>

        switch typeOfFetch {
        case .itemCategories: range = itemCategoryIDRange
        case .pokemon: range = pokemonIDRange
        case .region: range = regionIDRange
        }

        return range
    }

    // fetchData()内のstringURLsを求めるのに使用する  URLの配列を出力　一番初めにAPIで取得するURL群
    private static func switchURLsFromTypeOfFetch(typeOfFetch: TypeOfFetch, range: ClosedRange<Int>) -> [String] {

        let urls: [String] = range.map { id in

            let url: String
            switch typeOfFetch {
            case .itemCategories: url = "https://pokeapi.co/api/v2/item-pocket/\(id)/"
            case .pokemon: url = "https://pokeapi.co/api/v2/pokemon/\(id)/"
            case .region: url = "https://pokeapi.co/api/v2/region/\(id)/"
            }
            return url
        }
        return urls
    }

   static func fetchDataFromRegionAPI(regionIndex: Int, completion: @escaping ([Pokemon]) -> Void) {

        let stringURLs = switchURL(index: regionIndex)
        var pokemonArray: [Pokemon] = []

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
                    do {
                        let json = try JSONDecoder().decode(Pokemon.self, from: data)
                        pokemonArray.append(json)
                    } catch(let err) {
                        print(err)
                    }
                }

                if pokemonArray.count == urls.count {
                    pokemonArray.sort(by: { $0.id < $1.id })
                    completion(pokemonArray)
                }
            }
            task.resume()
        }
    }

   static func switchIDRangeForURL(index: Int) -> [String] {

        let range: ClosedRange<Int>
        var urls: [String] = []

        switch index {
        case 0: range = 1...151
        case 1: range = 152...251
        case 2: range = 252...386
        case 3: range = 387...493
        case 4: range = 494...649
        case 5: range = 650...721
        case 6: range = 722...807
        case 7: range = 810...898
        default: range = 0...0
        }

        for i in range {
            let url = "https://pokeapi.co/api/v2/pokemon/\(i)/"
            urls.append(url)
        }
        return urls
    }
}
