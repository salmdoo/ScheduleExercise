//
//  ScheduleGamesRepositoryLocalImp.swift
//  ScheduleExercise
//
//  Created by Salmdo on 6/9/25.
//

import Foundation
import Combine

struct ScheduleGamesRepositoryLocalImp: ScheduleGamesRepository {
    
    func fetchScheduleGames() -> AnyPublisher<GameSchedule, ServiceError> {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            return Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()
        }
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(GameScheduleResponse.self, from: data)
            let gameSchedule = GameSchedule(from: decoded)
            return Just(gameSchedule)
                .setFailureType(to: ServiceError.self)
                .eraseToAnyPublisher()
        } catch let error {
            return Fail(error: ServiceError.others(error)).eraseToAnyPublisher()
        }
    }
}

