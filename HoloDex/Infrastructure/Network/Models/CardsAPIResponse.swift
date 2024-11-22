//
//  CardsAPIResponse.swift
//  HoloDex
//
//  Created by Nathan Stéphant on 21/11/2024.
//

struct CardsAPIResponse: Decodable {
    let cardDetailsAPIModels: [CardDetailsAPIModel]?
    let page, pageSize, count, totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case cardDetailsAPIModels = "data"
        case page, pageSize, count, totalCount
    }
}
