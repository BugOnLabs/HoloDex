//
//  CardsViewModel.swift
//  HoloDex
//
//  Created by Adrien PEREA on 04/12/2024.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    @Published var cardDetailsAPIModels: [CardDetailsAPIModel]? = nil
    let cardsNetworkService = CardsNetworkServiceImpl()
    
    func fetchCards(pageSize: Int, page: Int, select: [String]) {
        cardsNetworkService.getCards(pageSize: pageSize, page: page, select: select){ result in
            switch result {
            case .success(let cardsApiResponse):
                self.cardDetailsAPIModels = cardsApiResponse.cardDetailsAPIModels
            case .failure(let error):
                print(error)
            }
        }
    }
}
