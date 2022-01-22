//
//  APIError.swift
//  PokemonDaisuki
//
//  Created by Rin on 2022/01/16.
//

import Foundation

enum APIErrpr: Error {
    case connectionError
    case invalidURL

    var alertTitle: String {
        switch self {
        case .connectionError:  return "通信エラー"
        case .invalidURL: return "無効なURL"
        }
    }

    var alertContent: String {
        switch self {
        case .connectionError: return "通信状況をお確かめの上、再度お試しください。"
        case .invalidURL: return "URLを確認の上、再度お試しください。"
        }
    }
}
