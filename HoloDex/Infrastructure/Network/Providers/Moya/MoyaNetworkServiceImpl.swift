//
//  MoyaNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//
import Moya

class MoyaNetworkServiceImpl: NetworkService {
    let provider = MoyaProvider<PokemonTcgApi>()

    func getCard(id: Int, select: [String]) {
        provider.request(.getCard(id: id, select: select)) { result in
            // bla bla
        }
    }
    
    func getCards(pageSize: Int, page: Int, select: [String]) {
        provider.request(.getCards(pageSize: pageSize, page: page, select: select)) { result in
            // bla bla
        }
    }
    
    
}
