//
//  CharactersManager.swift
//  surf_school_final
//
//  Created by Roman on 19.07.2024.
//

import Foundation





class CharactersManager {
    func GetCharacters(strUrl: String = "https://rickandmortyapi.com/api/character/") async throws -> ApiCharacterResponse {
        guard let url = URL(string: strUrl) else {fatalError("Wrong url")}
        let urlRequest = URLRequest(url: url)
        let (data, res) = try await URLSession.shared.data(for: urlRequest)
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Bed Response")}
        let decodedData = try JSONDecoder().decode(ApiCharacterResponse.self, from: data)
        return decodedData
    }
    
}


struct ApiCharacterResponse: Decodable {
    let info: Info
    let results: [Character]
}



struct Info: Decodable{
    let count: Int
    let next: String?
    let prev: String?
}
