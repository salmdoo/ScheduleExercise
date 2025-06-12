//
//  MockScheduleGamesService.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/25/25.
//
import Foundation
import Testing
import Combine
@testable import ScheduleExercise

class MockScheduleGamesService: FetchScheduleGamesUsecase {

    var shouldFailInvalidURL = false
    var jsonString = ""
    
    func fetchData() -> AnyPublisher<ScheduleExercise.GameScheduleResponse, ScheduleExercise.ServiceError> {
        if shouldFailInvalidURL {
            return Fail(error: ServiceError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            return Fail(error: ServiceError.noData)
                .eraseToAnyPublisher()
        }
        guard let gameSchedule = try? JSONDecoder().decode(GameScheduleResponse.self, from: jsonData) else {
            return Fail(error: ServiceError.others(NSError(domain: "Invalid Format", code: 0)))
                .eraseToAnyPublisher()
        }
        
        return Just(gameSchedule)
            .setFailureType(to: ServiceError.self)
            .eraseToAnyPublisher()
    }
}
