//
//  CardDetailsNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 22/11/2024.
//

import Foundation

class CardDetailsNetworkServiceImpl: NetworkService {
    
    let networkService: NetworkService = MoyaNetworkServiceImpl()
    
    func fetchCardDetails(cardId: String, select: [String], completion: @escaping (Result<CardDetailsAPIResponse, Error>) -> Void) {
        networkService.request(target: PokemonTcgApi.getCard(id: cardId, select: select)) { (result: Result<CardDetailsAPIResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
