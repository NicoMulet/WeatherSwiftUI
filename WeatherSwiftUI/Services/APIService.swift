//
//  APIService.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

struct APIService {
    let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/")!
    let apiKey = "cf0f31ab062ee5159fbd1c1c41a7057a"
    
    static let shared = APIService()
    
    let decoder = JSONDecoder()
    
    enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }
    
    enum Endpoint {
        case weather
        case dailyForecast, hourlyForecast
        
        func path() -> String {
            switch self {
            case .weather:
                return "weather"
            case .dailyForecast:
                return "forecast"
            case .hourlyForecast:
                return "forecast/hourly"
            }
        }
    }
    
    private func showRequestLog(_ method: String, _ url: String) {
        let reqString = method + " " + url
        
        let line = String(repeating: "=", count: reqString.count)
        print(line)
        print(reqString)
        print(line)
        print("")
        print("waiting for response...")
    }
    
    func GET<T: Codable>(endpoint: Endpoint, params: [String: String]? = nil, completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "appid", value: apiKey)]
        
        params?.forEach { value in
            components?.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
        }
        
        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            showRequestLog("GET", url.absoluteString)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.noResponse))
                    }
                    return
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.networkError(error: error)))
                    }
                    return
                }
                
                do {
                    let object = try self.decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(object))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        #if DEBUG
                            print("JSON decoding Error: \(error)")
                        #endif
                        completionHandler(.failure(.jsonDecodingError(error: error)))
                    }
                }
            }

            task.resume()
        }
    }
}
