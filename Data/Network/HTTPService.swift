//
//  HTTPService.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/20/25.
//


import Foundation
import Combine

// MARK: ServiceRequest protocol

protocol ServiceRequest {
    func fetchData<T: Decodable>() -> AnyPublisher<T, ServiceError>
}

// MARK: HTTPServiceImp
struct HTTPServiceImp: ServiceRequest {
    
    private var urlSession: URLSession
    private var url: String
    
    init(urlSession: URLSession = URLSession.shared, url: String) {
        self.urlSession = urlSession
        self.url = url
    }
    
    func fetchData<T>() -> AnyPublisher<T, ServiceError> where T : Decodable {
        guard let url =  URL(string: url) else {
            return Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return urlSession.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw ServiceError.invalidResponse
                }
                
                switch httpResponse.statusCode {
                case 200:
                    return data
                case 400:
                    throw ServiceError.badRequest
                case 500:
                    throw ServiceError.serverError
                default:
                    throw ServiceError.unknown
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                ServiceError.others(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
