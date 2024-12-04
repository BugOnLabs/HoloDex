//
//  CardsNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 04/12/2024.
//

import Foundation
import Moya

class CardsNetworkServiceImpl {
    
    let provider = MoyaNetworkServiceImpl()
    
    func getCards(pageSize: Int, page: Int, select: [String], completion: @escaping (Result<CardsAPIResponse, Error>) -> Void) {
        provider.request(target: PokemonTcgApi.getCards(pageSize: pageSize, page: page, select: select)) { (result: Result<CardsAPIResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
