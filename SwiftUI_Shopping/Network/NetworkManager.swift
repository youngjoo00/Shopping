//
//  NetworkManager.swift
//  SwiftUI_Shopping
//
//  Created by youngjoo on 5/10/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func callAPI<T: Decodable> (type: T.Type, text: String, sort: String, start: Int) async throws -> T {
        
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        var component = URLComponents()
        component.scheme = "https"
        component.host = "openapi.naver.com"
        component.path = "/v1/search/shop.json"
        
        component.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "display", value: "30"),
            URLQueryItem(name: "start", value: "\(start)"),
            URLQueryItem(name: "sort", value: "\(sort)"),
        ]
        
        guard let componentURL = component.url else {
            print("url 변환 실패")
            throw APIError.failedRequest
        }
        
        var url = URLRequest(url: componentURL)
        url.addValue(PrivateKey.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        url.addValue(PrivateKey.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let (data, response) = try await URLSession.shared.data(for: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("응답 실패")
            throw APIError.invalidResponse
        }
        
        do {
            let data = try JSONDecoder().decode(T.self, from: data)
            return data
        } catch {
            print(error, "디코딩 실패")
            throw APIError.invalidData
        }
    }
}
