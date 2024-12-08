//
//  CardsViewModel.swift
//  HoloDex
//
//  Created by Adrien PEREA on 04/12/2024.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    init(cardsUseCase: GetCardsUseCase) {
        self.cardsUseCase = cardsUseCase
    }
    
    @Published var cardDetailsAPIModels: [CardDetailsAPIModel]? = nil

    let cardsUseCase: GetCardsUseCase
    
    func fetchCards(pageSize: Int, page: Int, select: [String]) {
        cardsUseCase.getCards(requestValue: GetCardsUseCaseRequestValue(pageSize: pageSize, page: page, select: select)){ result in
            switch result {
            case .success(let cardsApiResponse):
                self.cardDetailsAPIModels = cardsApiResponse.cardDetailsAPIModels
            case .failure(let error):
                print(error)
            }
        }
    }
}
