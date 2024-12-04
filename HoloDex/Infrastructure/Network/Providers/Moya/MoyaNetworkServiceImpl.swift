//
//  MoyaNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//
import Moya

class MoyaNetworkServiceImpl: NetworkService {
    
    let provider = MoyaProvider<PokemonTcgApi>()
    
    init() {}

    func request<T:Decodable>(target: TargetType, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target as! PokemonTcgApi) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
