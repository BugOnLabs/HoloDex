//
//  CardDetailsAPIResponse.swift
//  HoloDex
//
//  Created by Nathan Stéphant on 21/11/2024.
//

struct CardDetailsAPIResponse: Decodable {
    let cardDetailsAPIModel: CardDetailsAPIModel?
    
    enum CodingKeys: String, CodingKey {
        case cardDetailsAPIModel = "data"
    }
}

struct CardDetailsAPIModel: Decodable {
    let id, name, supertype: String?
    let subtypes: [String]?
    let hp: String?
    let types: [String]?
    let evolvesFrom: String?
    let abilities: [Ability]?
    let attacks: [Attack]?
    let weaknesses, resistances: [Resistance]?
    let retreatCost: [String]?
    let convertedRetreatCost: Int?
    let dataSet: Set?
    let number, artist, rarity: String?
    let nationalPokedexNumbers: [Int]?
    let legalities: Legalities?
    let images: DataImages?
    let tcgplayer: Tcgplayer?
    let cardmarket: Cardmarket?
    
    enum CodingKeys: String, CodingKey {
        case id, name, supertype, subtypes, hp, types, evolvesFrom, abilities, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
        case dataSet = "set"
        case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket
    }
}

// MARK: - Ability
struct Ability: Decodable {
    let name, text, type: String?
}

// MARK: - Attack
struct Attack: Decodable {
    let name: String?
    let cost: [String]?
    let convertedEnergyCost: Int?
    let damage, text: String?
}

// MARK: - Cardmarket
struct Cardmarket: Decodable {
    let url: String?
    let updatedAt: String?
    let prices: [String: Double]?
}

// MARK: - Set
struct Set: Decodable {
    let id, name, series: String?
    let printedTotal, total: Int?
    let legalities: Legalities?
    let ptcgoCode, releaseDate, updatedAt: String?
    let images: SetImages?
}

// MARK: - SetImages
struct SetImages: Decodable {
    let symbol, logo: String?
}

// MARK: - Legalities
struct Legalities: Decodable {
    let unlimited: String?
}

// MARK: - DataImages
struct DataImages: Decodable {
    let small, large: String?
}

// MARK: - Resistance
struct Resistance: Decodable {
    let type, value: String?
}

// MARK: - Tcgplayer
struct Tcgplayer: Decodable {
    let url: String?
    let updatedAt: String?
    let prices: Prices?
}

// MARK: - Prices
struct Prices: Decodable {
    let holofoil, reverseHolofoil: Holofoil?
}

// MARK: - Holofoil
struct Holofoil: Decodable {
    let low, mid, high, market: Double?
}
