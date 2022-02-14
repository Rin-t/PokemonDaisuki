//
//  FetchAPIs.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/16.
//

import Foundation

struct FetchAPIs {

    private static let ballIdRange = 1...16 // ボールの種類
    private static let pokemonIDRange = 1...151 // クイズ用のポケモンデータは151種類
    private static let regionIDRange = 1...8 // 地域は8種類

    // APIを叩く際の項目
    enum TypeOfFetch {
        case ball
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
   static func decodeBallData(completion: @escaping ([Ball]) -> Void) {

         FetchAPIs.fetchData(typeOfFetch: .ball) { dataArray in
            var jsons: [Ball] = []

            for data in dataArray {
                do {
                    let json = try JSONDecoder().decode(Ball.self, from: data)
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
        case .ball: range = ballIdRange
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
            case .ball: url = "https://pokeapi.co/api/v2/item/\(id)/"
            case .pokemon: url = "https://pokeapi.co/api/v2/pokemon/\(id)/"
            case .region: url = "https://pokeapi.co/api/v2/region/\(id)/"
            }
            return url
        }
        return urls
    }
}
