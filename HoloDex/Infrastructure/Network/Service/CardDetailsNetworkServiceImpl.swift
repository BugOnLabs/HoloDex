//
//  CardDetailsNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 22/11/2024.
//

import Foundation
import Moya

class CardDetailsNetworkServiceImpl {
    
    let provider = MoyaNetworkServiceImpl()
    
    func getCardDetail(id: String, select: [String], completion: @escaping (Result<CardDetailsAPIResponse, Error>) -> Void) {
        provider.request(target: PokemonTcgApi.getCard(id: id, select: select)) { (result: Result<CardDetailsAPIResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
