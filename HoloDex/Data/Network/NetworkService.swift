//
//  NetworkService.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//

protocol NetworkService {
    func getCard(id: Int, select: [String])
    func getCards(pageSize: Int, page: Int, select: [String])
}
