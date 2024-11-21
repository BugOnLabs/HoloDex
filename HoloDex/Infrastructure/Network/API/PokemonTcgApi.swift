//
//  PokemonTcgApi.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//

import Moya

enum PokemonTcgApi {
    case getCard(id: Int, pageSize: Int, page: Int, select: [String])
    case getCards(pageSize: Int, page: Int, select: [String])
}

extension PokemonTcgApi: TargetType {
    var baseURL: URL { URL(string: "https://api.myservice.com")! }
    
    var path: String {
        switch self {
        case .getCard, .getCards:
            return "/cards"
        }
        
    }
    var method: Moya.Method {
        switch self {
        case .getCard, .getCards:
            .get
        }
    }
    var task: Task {
        switch self {
        case .getCard(id: let id, pageSize: let pageSize, page: let page, select: let select):
            return .requestParameters(parameters: ["id": id, "pageSize": pageSize, "page": page, "select": select.joined(separator: ",")], encoding: URLEncoding.queryString)
        case .getCards(pageSize: let pageSize, page: let page, select: let select):
            return .requestParameters(parameters: ["pageSize": pageSize, "page": page, "select": select.joined(separator: ",")], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
