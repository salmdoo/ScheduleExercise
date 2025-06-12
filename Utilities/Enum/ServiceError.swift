//
//  ServiceError.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

enum ServiceError: Error {
    case invalidURL
    case noData
    case invalidResponse
    case badRequest
    case serverError
    case unknown
    case others(_ error: Error)
}

extension ServiceError {
    var message: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid"
        case .noData:
            return "No data was returned from the request"
        case .invalidResponse:
            return "Invalid response from server"
        case .badRequest:
            return "Bad request"
        case .serverError:
            return "Server error"
        case .unknown:
            return "An unknown error occurred"
        case .others(let error):
            return error.localizedDescription
        }
    }
}
