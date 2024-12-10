//
//  DefaultCardsRepository.swift
//  HoloDex
//
//  Created by Adrien PEREA on 10/12/2024.
//

final class DefaultCardsRepository {
    
    let networkService = CardsNetworkServiceImpl()

    init() {}
}

extension DefaultCardsRepository: CardsRepository {
    func fetchCardsList(pageSize: Int, page: Int, select: [String], completion: @escaping (Result<CardsAPIResponse, any Error>) -> Void) {
        networkService.getCards(pageSize: pageSize, page: page, select: select) { result in
            completion(result)
        }
    }
}
